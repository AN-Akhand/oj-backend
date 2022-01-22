import dotenv from 'dotenv';
import express from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import oracledb from 'oracledb';
import auth from '../Middleware/auth.js'
import moment from 'moment';
import {executeQuery} from '../DB/executequery.js';
oracledb.autoCommit = true;
dotenv.config();
const router = express.Router();
router.use(express.json());

router.get('/:handle', auth, (req, res) => {
    if(res.locals.handle == req.params.handle){
        //info abount yourself
        console.log('info abount yourself');
    }else {
        //info about someone else
        console.log('info about someone else');
    }
    res.sendStatus(200);
});

router.post('/signup', async (req, res) => {
    let result;
    try{
        const hashedPass = await bcrypt.hash(req.body.pass, 10);
        let user = req.body;
        user.pass = hashedPass;
        let checkUser = `SELECT handle FROM users WHERE handle = :handle`;
        result = await executeQuery(checkUser, [user.handle]);
        if(result.rows.length != 0){
            res.status(500).send();
            return;
        }
        let insertUser = `INSERT INTO USERS(handle, name, password, last_login, email) VALUES(:handle, :name, :pass, :last_login, :email)`;
        result = await executeQuery(insertUser, user);
        res.status(201).send();
    }catch(err) {
        console.log(err);
        res.status(500).send();
    }
});

router.post('/login', async (req, res) => {
    let result;
    try{
        let query = `SELECT * FROM USERS WHERE HANDLE = :handle`;
        result = await executeQuery(query, [req.body.handle]);
        if(result.rows.length == 0){
            return res.status(400).send({error: "No such user"});
        }
        if(await bcrypt.compare(req.body.pass, result.rows[0][2])){
            query = `UPDATE USERS SET LAST_LOGIN = TO_DATE(:now, 'DD/MM/YYYY') WHERE HANDLE = :handle`;
            await executeQuery(query, [moment().format("DD/MM/YYYY"), req.body.handle]);
            const accessToken = jwt.sign({handle: req.body.handle}, process.env.SECRET_KEY, {expiresIn: '5m'});
            res.json({ accessToken: accessToken });
        }
        else{
            return res.status(400).send({error: "Wrong password"})
        }
    }catch(err) {
        console.log(err);
        res.status(500).send();
    }
})
export default router;
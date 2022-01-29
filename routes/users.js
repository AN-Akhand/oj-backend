import dotenv from 'dotenv';
import express from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import auth from '../Middleware/auth.js'
import moment from 'moment';
import {executeQuery} from '../DB/executequery.js';

const router = express.Router();
router.use(express.json());

router.get('/:handle', auth, async (req, res) => {
    if (res.locals.handle === req.params.handle) {
        //info abount yourself
        console.log('info about yourself');
        const sql = `SELECT * FROM users where handle = :handle`;
        try{
            const checkResult = await executeQuery(sql, {handle: req.params.handle});

            console.log(checkResult)

            const profileDetail = {
                handle: checkResult.rows[0][0],
                name: checkResult.rows[0][1],
                joinDate: checkResult.rows[0][3],
                lastLogin: checkResult.rows[0][4],
                rating: checkResult.rows[0][5],
                email: checkResult.rows[0][6],
                country: checkResult.rows[0][7],
                institute: checkResult.rows[0][8]
            }
            res.json(profileDetail);
        }catch (err){
            res.status(501).send({error:"server internal error"})
        }

    } else {
        //info about someone else
        console.log('info about someone else');
        res.json("why?")
    }
    // res.sendStatus(200);
});

router.post('/signup', async (req, res) => {
    let user = req.body;
    console.log(user);
    try{
        const hashedPass = await bcrypt.hash(user.password, 10);
        user.password = hashedPass;
        const sqlToCheck = `SELECT COUNT(*) FROM users WHERE handle = :handle`;
        const checkResult = await executeQuery(sqlToCheck, {handle: user.handle});
        console.log(checkResult);
        if(checkResult.rows[0][0] !== 0) {
            res.status(500).send({error: "handle taken already :( "});
            return;
        }
    }catch (err){
        console.error("1st: "+err)
        res.status(500).send({error: "server internal error1"})
    }
    try{
        const insertUser = `INSERT INTO users(handle, name, password, email, country, institute) VALUES(:handle, :name, :password, :email, :country, :institute)`;
        const finalResult = await executeQuery(insertUser, user);
        res.status(201).send({message: "Sign Up Successful..."})
    }catch (err){
        console.error("2nd: "+err)
        res.status(500).send({error: "server internal error2"})
    }
    // try{
    //     const hashedPass = await bcrypt.hash(req.body.pass, 10);
    //     let user = req.body;
    //     user.pass = hashedPass;
    //     let checkUser = `SELECT handle FROM users WHERE handle = :handle`;
    //     result = await executeQuery(checkUser, [user.handle]);
    //     if(result.rows.length != 0){
    //         res.status(500).send();
    //         return;
    //     }
    //     let insertUser = `INSERT INTO USERS(handle, name, password, last_login, email) VALUES(:handle, :name, :pass, :last_login, :email)`;
    //     result = await executeQuery(insertUser, user);
    //     res.status(201).send();
    // }catch(err) {
    //     console.log(err);
    //     res.status(500).send();
    // }
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
            query = `UPDATE USERS SET LAST_LOGIN = TO_DATE(:now, 'DD/MM/YYYY HH24:MI:SS') WHERE HANDLE = :handle`;
            await executeQuery(query, [moment().format("DD/MM/YYYY HH:mm:ss"), req.body.handle]);
            const accessToken = jwt.sign({handle: req.body.handle}, process.env.SECRET_KEY, {expiresIn: '30m'});
            res.json({ accessToken: accessToken });
        }
        else{
            return res.status(400).send({error: "Wrong password"})
        }
    }catch(err) {
        console.log(err);
        res.status(500).send({error: "server internal error"});
    }
})
export default router;
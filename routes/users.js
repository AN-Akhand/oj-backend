import dotenv from 'dotenv';
import express from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import oracledb from 'oracledb';
import auth from '../Middleware/auth.js'
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
    let conn;
    try{
        const hahsedPass = await bcrypt.hash(req.body.pass, 10);
        let user = req.body;
        user.pass = hahsedPass;
        user.join_date = Date.now();
        let insertUser = `INSERT INTO USERS VALUES(:handle, :name, :pass, :join_date, :last_login, :global_rating, :email)`;
        conn = await oracledb.getConnection({user: 'hr', password: 'hr', connectionString: '0.0.0.0/orcl'});
        await conn.execute(insertUser, user);
        res.status(201).send();
    }catch(err) {
        console.log(err);
        res.status(500).send();
    }finally{
        if(conn != null){
            try{
                conn.close();
            }catch(err){
                console.log(err);
            }
        }
    }
});

router.post('/login', async (req, res) => {
    let conn;
    let result;
    try{
        conn = await oracledb.getConnection({user: 'hr', password: 'hr', connectionString: '0.0.0.0/orcl'});
        result = await conn.execute(`SELECT * FROM USERS WHERE HANDLE = :handle`, [req.body.handle]);
        if(result.rows.length == 0){
            return res.status(400).send("No such user");
        }
        if(await bcrypt.compare(req.body.pass, result.rows[0][2])){
            await conn.execute(`UPDATE USERS SET LAST_LOGIN = :now WHERE HANDLE = :handle`, [Number(Date.now()), req.body.handle]);
            const accessToken = jwt.sign({handle: req.body.handle}, process.env.SECRET_KEY, {expiresIn: '5m'});
            res.json({ accessToken: accessToken });
        }
        else{
            console.log('wrong password');
        }
    }catch(err) {
        console.log(err);
        res.status(500).send();
    }finally{
        try{
            conn.close();
        }catch(err){
            console.log(err);
        }
    }
})
export default router;
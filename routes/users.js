import express from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import auth from '../Middleware/auth.js'
import moment from 'moment';
import {executeQuery} from '../DB/executequery.js';

const router = express.Router();
router.use(express.json());

router.post('/getUser', auth, async (req, res) => {
    let isOwner = false;
    let handle = req.body.handle;
    console.log(handle, res.locals.handle);
    const sql = `SELECT * FROM users where handle = :handle`;
    try{
        const checkResult = await executeQuery(sql, {handle: handle});
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
        if (res.locals.handle == handle) {
            isOwner = true;
        }
        res.json({status: "success", profileDetail: profileDetail, owner: isOwner});
    }catch (err){
        res.json({status: "failed", message:"server internal error"})
    }
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
            res.json({status: "failed", message:"handle already taken!"})
            return;
        }
    }catch (err){
        console.error("1st: "+err)
        res.json({status: "failed", message:"server internal error"})
    }
    try{
        const insertUser = `INSERT INTO users(handle, name, password, email, country, institute) VALUES(:handle, :name, :password, :email, :country, :institute)`;
        const finalResult = await executeQuery(insertUser, user);
        res.json({status: 'success', message: "Sign Up Successful..."})
    }catch (err){
        console.error("2nd: "+err)
        res.json({status: "failed", message:"failed to insert into user table!"})
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
            return res.json({status: "failed", message:"No such user"})
        }
        if(await bcrypt.compare(req.body.pass, result.rows[0][2])){
            query = `UPDATE USERS SET LAST_LOGIN = TO_DATE(:now, 'DD/MM/YYYY HH24:MI:SS') WHERE HANDLE = :handle`;
            await executeQuery(query, [moment().format("DD/MM/YYYY HH:mm:ss"), req.body.handle]);
            const accessToken = jwt.sign({handle: req.body.handle}, process.env.SECRET_KEY, {expiresIn: '30m'});
            res.json({status: 'success', accessToken: accessToken });
        }
        else{
            res.json({status: "failed", message:"Wrong Password"})
        }
    }catch(err) {
        console.log(err);
        res.json({status: "failed", message:"server internal error"})
    }
})



router.get('/', async (req, res)=>{
    try{
        const query = `SELECT HANDLE, NAME, GLOBAL_RATING FROM USERS ORDER BY GLOBAL_RATING DESC`;
        const result = await executeQuery(query, {});
        let users = [];
        result.rows.forEach(u=>{
            users.push({
                handle: u[0],
                name: u[1],
                rating: u[2]
            })
        })
        res.json({status: 'success', users: users});
    }catch(error){
        console.log(error);
        res.json({status: 'failure', message: error});
    }
})


router.get('/search', async (req, res)=>{
    try{
        const searchStr = req.body.searchStr;
        const query = `SELECT HANDLE, NAME FROM USERS WHERE LOWER(HANDLE) LIKE '%${searchStr}%'`;
        const result = await executeQuery(query, {});
        let users = [];
        result.rows.forEach(u=>{
            users.push({
                handle: u[0],
                name: u[1],
            })
        })
        res.json({status: 'success', users: users});
    }catch(error){
        console.log(error);
        res.json({status: 'failure', message: error});
    }
})

router.get('/rating', async (req, res)=>{
    try{
        const query = `SELECT * FROM USERS ORDER BY GLOBAL_RATING DESC`;
        const result = await executeQuery(query, {});
		// console.log(result);
        let users = [];
        result.rows.forEach(u=>{
            users.push({
                handle: u[0],
                name: u[1],
				rating: u[5]
            })
        })
        res.json({status: 'success', users});
    }catch(error){
        console.log(error);
        res.json({status: 'failure', message: error});
    }
})



export default router;
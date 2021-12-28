require('dotenv').config();
const express = require('express');
const User = require('../Models/User.js');
const bcrypt = require('bcrypt');
const router = express.Router();
const jwt = require('jsonwebtoken');
router.use(express.json())

router.get('/', (req, res) => {
    res.send("Bleh")
});

const users = [];

router.post('/signup', async (req, res) => {

    try{
        const hahsedPass = await bcrypt.hash(req.body.pass, 10);
        user = new User(req.body.name, hahsedPass);
        //sql balsal here
        users.push(user);
        //sql balsal here
        res.status(201).send();
    }catch{
        res.status(500).send();
    }
});

router.post('/login', async (req, res) => {
    const user = users.find(user => user.name === req.body.name);
    if(user == null){
        return res.status(400).send("No such user");
    }

    try{
        if(await bcrypt.compare(req.body.pass, user.password)){
            console.log('success');
            const accessToken = jwt.sign(JSON.stringify(user), process.env.SECRET_KEY);
            res.json({ accessToken: accessToken });
        }
        else{
            console.log('wrong password');
        }
    }catch{
        res.status(500).send();
    }
})

module.exports = router;
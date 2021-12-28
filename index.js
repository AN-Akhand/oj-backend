require('dotenv').config();
const express = require('express');
const app = express();
const userRouter = require('./routes/users');
const PORT = process.env.PORT;

app.get('/', (req, res) => {
    res.send('hello')
});

app.use('/users', userRouter);

app.listen(PORT);

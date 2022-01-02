import dotenv from 'dotenv';
dotenv.config();
import express from 'express';
const app = express();
import userRouter from './routes/users.js';
const PORT = process.env.PORT;

app.get('/', (req, res) => {
    res.send('hello')
});

app.use('/users', userRouter);

app.listen(PORT);

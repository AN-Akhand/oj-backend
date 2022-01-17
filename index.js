import dotenv from 'dotenv';
import express from 'express';
import userRouter from './routes/users.js';
import cors from "cors";

dotenv.config();

const PORT = process.env.PORT;
const app = express();

app.use(cors());

app.use(cors())
app.options('*', cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.send('hello')
});

app.use('/users', userRouter);

// app.use('/testAuth', (req, res)=>{
//
// })

app.listen(PORT);

import dotenv from 'dotenv';
import express from 'express';
import userRouter from './routes/users.js';
import contestRouter from './routes/contests.js';
import problemRouter from './routes/problems.js';
import blogRouter from './routes/blogs.js'
import cors from "cors";
import oracledb from 'oracledb';

dotenv.config();

const PORT = process.env.PORT;
const app = express();

app.use(cors());
app.options('*', cors());
app.use(express.json({limit: "50mb"}));
try{
    console.log('creating connectionpool');
    await oracledb.createPool({user: process.env.DB_USER, password: process.env.DB_PASSWORD, connectionString: process.env.DB_CONN_STRING});
}catch(err){
    console.log(err);
}

app.get('/', (req, res) => {
    res.send('hello')
});

app.use('/users', userRouter);
app.use('/contests', contestRouter);
app.use('/problems', problemRouter);
app.use('/blogs', blogRouter);

let server = app.listen(PORT);

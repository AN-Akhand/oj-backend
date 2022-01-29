import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';

const router = express.Router();
router.use(express.json());

router.get('/', async (req, res) => {
    console.log("list of contests");
    res.send("contests");
})

export default router;
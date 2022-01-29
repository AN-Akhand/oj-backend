import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';
import moment from 'moment';
import oracledb from 'oracledb';

const router = express.Router();
router.use(express.json());

router.get('/', async (req, res) => {
    console.log("list of contests");
    res.send("contests");
});

router.post('/create', auth, async (req, res) => {
    let contest = req.body;
    console.log(contest);
    try{
        let start_time = moment(contest.start_time).format("DD/MM/YYYY HH:mm:ss");
        let end_time = moment(contest.end_time).format("DD/MM/YYYY HH:mm:ss");
        let handle = res.locals.handle;
        let title = contest.title;
        let data = contest.announcement;
        console.log({start_time, end_time, handle});
        let query = `BEGIN 
                        insert_contest(:start_time, :end_time, :handle, :title, :id);
                    END;`;
        let result = await executeQuery(query, {start_time, end_time, handle, title, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
        let contest_id = result.outBinds.id;
        query = `BEGIN
                    insert_blog(:handle, :data, :id);
                END;`;
        result = await executeQuery(query, {handle, data, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
        let blog_id = result.outBinds.id;
        query = `INSERT INTO announcements(blog_id, contest_id) VALUES(:blog_id, :contest_id)`;
        result = await executeQuery(query, {blog_id, contest_id});
        res.sendStatus(200)
    }catch(err){
        res.sendStatus(500);
        console.error(err);
    }
});

export default router;
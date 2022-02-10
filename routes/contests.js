import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';
import moment from 'moment';
import oracledb from 'oracledb';
import fs from 'fs';

const router = express.Router();
router.use(express.json());

router.get('/contests', async (req, res) => {
    try{
        const query = `SELECT * FROM CONTESTS`;
        const result = await executeQuery(query, {});
        console.log(result)
        let allContest = [];
        const rows = result.rows;
        const numOfContest = rows.length;
        for(let i=0; i<numOfContest; i++){
            const contest = rows[i];
            allContest.push({
                id: contest[0],
                title: contest[1],
                startTime: contest[2],
                endTime: contest[3],
                setter: contest[6]
            })
        }
        res.json({status: 'success', contests: allContest})
    }catch (e) {
        console.error(e)
        res.json({status: 'failure', reason: e})
    }
});

router.post('/get', async (req, res) => {
    // console.log("eitay eshe disturb ditese?")
    let contestId = req.body.contestId;
    console.log(req.body)
    try{
        const query = `SELECT * FROM CONTESTS WHERE CONTEST_ID = :contestId`;
        const result = await executeQuery(query, {contestId});
        console.log(result)

        console.log("tends to success")
        if(result.rows.length < 1){
            res.json({status: 'failed', message: 'no such contest found!'})
        }
        const contest = result.rows[0];
        const contestData = {
            contestId: contest[0],
            title: contest[1],
            startTime: contest[2],
            endTime: contest[3],
            setter: contest[6],
        }

        res.json({status: 'success', message: contestData});
    }catch (error){
        console.error(error);
        res.status(404)
    }
})

router.post('/create', auth, async (req, res) => {
    let contest = req.body;
    console.log(contest);
    try{
        let start_time = moment(contest.startTime).format("DD/MM/YYYY HH:mm:ss");
        let end_time = moment(contest.endTime).format("DD/MM/YYYY HH:mm:ss");
        let handle = res.locals.handle;
        let title = contest.title;
        let data = contest.announcement;
        console.log({start_time, end_time, handle});
        let query = `BEGIN 
                        insert_contest(:start_time, :end_time, :handle, :title, :id);
                    END;`;
        let result = await executeQuery(query, {start_time, end_time, handle, title, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
        let contest_id = result.outBinds.id;
        let dir = "contests/" + contest_id;
        if(!fs.existsSync(dir)){
            fs.mkdirSync(dir, (err, file)=>{
                if(err) throw err;
            });
        }

        query = `BEGIN
                    insert_blog(:handle, :data, :id);
                END;`;
        result = await executeQuery(query, {handle, data, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
        let blog_id = result.outBinds.id;
        query = `INSERT INTO announcements(blog_id, contest_id) VALUES(:blog_id, :contest_id)`;
        result = await executeQuery(query, {blog_id, contest_id});

        console.log("contest created successfully: ");
        console.log(result)

        res.json({contestId: contest_id});
    }catch(err){
        res.sendStatus(500);
        console.error(err);
    }
});

export default router;
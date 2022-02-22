import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';
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
                startTime: contest[5],
                endTime: contest[6],
                setter: contest[4]
            })
        }
        res.json({status: 'success', contests: allContest})
    }catch (e) {
        console.error(e)
        res.json({status: 'failure', reason: e})
    }
});

router.post('/get', auth, async (req, res) => {
    // console.log("eitay eshe disturb ditese?")
    try{
        let contestId = req.body.contestId;
        let handle = res.locals.handle;
        let isOwner = false;
        console.log(req.body)
        const query = `SELECT * FROM CONTESTS WHERE CONTEST_ID = :contestId`;
        const result = await executeQuery(query, {contestId});
        console.log(result)

        console.log("tends to success")
        if(result.rows.length < 1){
            res.json({status: 'failed', message: 'no such contest found!'})
        }
        const contest = result.rows[0];
        if(handle == contest[4]){
            isOwner = true;
        }
        const contestData = {
            contestId: contest[0],
            title: contest[1],
            startTime: contest[5],
            endTime: contest[6],
            setter: contest[4],
        }

        res.json({status: 'success', message: contestData, owner: isOwner});
    }catch (error){
        console.error(error);
        res.json({status: 'failure', message: error});
    }
})

router.post('/create', auth, async (req, res) => {
    try{
        let contest = req.body;
        console.log(contest);
        let start_time = contest.startTime;
        let end_time = contest.endTime;
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
                    insert_blog(:handle, :data, :publishDate, :title, :id);
                END;`;
        let publishDate = Date.now();
        result = await executeQuery(query, {handle, data, publishDate, title, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
        let blog_id = result.outBinds.id;
        query = `INSERT INTO announcements(blog_id, contest_id) VALUES(:blog_id, :contest_id)`;
        result = await executeQuery(query, {blog_id, contest_id});

        console.log("contest created successfully: ");
        console.log(result)

        res.json({status: 'success', message: {contestId: contest_id}});
    }catch(err){
        res.json({status: 'failure', message: err});
        console.error(err);
    }
});


router.post("/delete", auth, async(req, res)=>{
    try{
        const contestId = req.body.contestId;
        const handle = res.locals.handle;
        let query = `SELECT START_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId AND HANDLE = :handle`;
        let result = await executeQuery(query, {contestId, handle});
        if(result.rows.length == 0){
            throw "No such contest";
        }
        if(result.rows[0][0] < Date.now()){
            throw "Contest Running";
        }
        query = `DELETE FROM CONTESTS WHERE CONTEST_ID = :contestId`;
        result = await executeQuery(query, {contestId});
        fs.rmSync("contests/" + contestId, {recursive: true});
        res.json({status: 'success', message: result});
    }catch(err){
        res.json({status: 'failure', message: err})
        console.error(err);
    }
})



router.post("/edit", auth, async(req, res)=>{
    try{
        const contestId = req.body.contestId;
        const handle = res.locals.handle;
        const title = req.body.title;
        const startTime = req.body.startTime;
        const endTime = req.body.endTime;
        let query = `SELECT START_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId AND HANDLE = :handle`;
        let result = await executeQuery(query, {contestId, handle});
        if(result.rows.length == 0){
            throw "Not Allowed";
        }
        if(result.rows[0][0] < Date.now()){
            throw "Not Allowed";
        }
        query = `UPDATE CONTESTS SET TITLE = :title, START_TIME = :startTime, END_TIME = :endTime WHERE CONTEST_ID = :contestId`;
        result = await executeQuery(query, {title, startTime, endTime, contestId});
        res.json({status: 'success', message: result});
    }catch(err){
        res.json({status: 'failure', message: err})
        console.error(err);
    }
});



router.post("/generateResult", auth, async(req, res)=>{
    try{
        const contestId = req.body.contestId;
        const handle = res.locals.handle;
        let query = `SELECT HANDLE, END_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId`;
        let result = await executeQuery(query, {contestId});
        if(result.rows[0][0] != handle || result.rows[0][1] > Date.now()){
            throw "Not Allowed";
        }
        query = `SELECT RATING_CHANGE FROM STANDINGS WHERE CONTEST_ID = :contestId FETCH FIRST 1 ROWS ONLY`;
        result = await executeQuery(query, {contestId});
        if(result.rows.length != 0 && result.rows[0][0] != null){
            throw "Not Allowed";
        }
        query = `BEGIN
                    update_rating(:contestId);
                END;`;
        result = await executeQuery(query, {contestId});
        res.json({status: 'success', message: result});
    }catch(error){
        res.json({status: 'failure', message: error})
        console.error(error);
    }
});



router.get("/getResult", auth, async(req, res)=>{
    try{
        const contestId = req.body.contestId;
        const handle = res.locals.handle;
        let query = `SELECT HANDLE, END_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId`;
        let result = await executeQuery(query, {contestId});
        if(result.rows.length == 0 || result.rows[0][1] > Date.now()){
            throw "Not Allowed";
        }
        query = `SELECT RATING_CHANGE FROM STANDINGS WHERE CONTEST_ID = :contestId FETCH FIRST 1 ROWS ONLY`;
        result = await executeQuery(query, {contestId});
        if(result.rows.length != 0 && result.rows[0][0] == null){
            throw "Not Allowed";
        }
        query = `SELECT * FROM STANDINGS WHERE CONTEST_ID = :contestId ORDER BY AC_PROBLEMS DESC, PENALTY ASC`;
        result = await executeQuery(query, {contestId});
        let standings = [];
        result.rows.forEach(s=>{
            standings.push({
                contestId: s[0],
                handle: s[1],
                acProblems: s[2],
                wrongSubs: s[4],
                ratingChange: s[5]
            })
        })

        res.json({status: 'success', standings: standings});
    }catch(error){
        res.json({status: 'failure', message: error})
        console.error(error);
    }
})

router.get('/search', async (req, res)=>{
    try{
        const searchStr = req.body.searchStr;
        const query = `SELECT CONTEST_ID, TITLE FROM CONTESTS WHERE LOWER(TITLE) LIKE '%${searchStr}%'`;
        const result = await executeQuery(query, {});
        let contests = [];
        result.rows.forEach(c=>{
            contests.push({
                contestId: c[0],
				title: c[1]
            })
        })
        res.json({status: 'success', contests: contests});
    }catch(error){
        console.log(error);
        res.json({status: 'failure', message: error});
    }
})

export default router;
import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';
import oracledb from 'oracledb';

const router = express.Router();
router.use(express.json());

router.get('/', async (req, res) => {
    console.log("list of blogs");
    res.send("blogs");
})

router.post("/create-blog", auth, async(req, res)=>{
    try{
        const title = req.body.blogTitle;
        const data = req.body.blogBody;
        const publishDate = req.body.created;
        const handle = res.locals.handle;
        let query = `BEGIN
                        insert_blog(:handle, :data, :publishDate, :title, :id);
                    END;`
        let result = await executeQuery(query, {handle, data, publishDate, title, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
        const blogId = result.outBinds.id;
        res.json({status: 'success', message: blogId});
    }catch(error){
        console.log(error);
		res.json({status: 'failed', message: error});
    }
});



router.post("/create-tutorial", auth, async(req, res)=>{
    try{
        const title = req.body.blogTitle;
        const data = req.body.blogBody;
        const publishDate = req.body.created;
        const contestId = req.body.contestId;
        const problemId = req.body.problemId;
        const handle = res.locals.handle;
        let query = `BEGIN
                        insert_blog(:handle, :data, :publishDate, :title, :id);
                    END;`
        let result = await executeQuery(query, {handle, data, publishDate, title, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
        const blogId = result.outBinds.id;
        query = `INSERT INTO TUTORIALS VALUES(:blogId, :contestId, :problemId)`;
        result = await executeQuery(query, {blogId, contestId, problemId});
        res.json({status: 'success', message: blogId});
    }catch(error){
        console.log(error);
		res.json({status: 'failed', message: error});
    }
});


router.get("/get/:id", auth, async(req, res)=>{
    try{
        const blogId = req.params.id;
        let isOwner = false;
        const handle = res.locals.handle;
        let query = `SELECT * FROM BLOGS WHERE BLOG_ID = :blogId`;
        let result = await executeQuery(query, {blogId});
        if(result.rows.length == 0){
            throw "No such blog";
        }
        let b = result.rows[0];
        if(handle == result.rows[0][0]){
            isOwner = true;
        }

        let blog = {
            handle: b[0],
            blogId: b[1],
            data: b[2],
            category: b[3],
            publishDate: b[4],
            title: b[5]
        };

        res.send({status: 'success', blog: b, owner: isOwner});

    }catch(error){
        console.log(error);
		res.json({status: 'failed', message: error});
    }
})


export default router;
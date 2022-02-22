import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';
import oracledb from 'oracledb';

const router = express.Router();
router.use(express.json());

router.get('/', async (req, res) => {
    try{
        const handle = req.body.handle;
        const query = `SELECT HANDLE, BLOG_ID, TITLE FROM BLOGS`;
        const result = await executeQuery(query, {});
        let blogs = [];
        result.rows.forEach(b=>{
            blogs.push({
                handle: b[0],
                blogId: b[1],
                title: b[2]
            })
        })
        res.json({status: 'success', blogs: blogs});
    }catch(error){
        console.log(error);
		res.json({status: 'failed', message: error});
    }
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

        res.json({status: 'success', blog: blog, owner: isOwner});

    }catch(error){
        console.log(error);
		res.json({status: 'failed', message: error});
    }
})


router.post("/comment", auth, async(req, res)=>{
    try{
        const data = req.body.comment;
        const time = req.body.time;
        const handle = res.locals.handle;
        const blogId = req.body.blogId;
        let query = `BEGIN
                        insert_comment(:handle, :data, :blogId, :time, :id);
                    END;`
        let result = await executeQuery(query, {handle, data, blogId, time, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
        const commentId = result.outBinds.id;
        res.json({status: 'success', commentId: commentId});
    }catch(error){
        console.log(error);
		res.json({status: 'failed', message: error});
    }
});


router.get("/getUserBlogs", auth, async(req, res)=>{
    try{
        const handle = req.body.handle;
        const query = `SELECT HANDLE, BLOG_ID, TITLE FROM BLOGS WHERE HANDLE = :handle`;
        const result = await executeQuery(query, {handle});
        let blogs = [];
        result.rows.forEach(b=>{
            blogs.push({
                handle: b[0],
                blogId: b[1],
                title: b[2]
            })
        })
        res.json({status: 'success', blogs: blogs});
    }catch(error){
        console.log(error);
		res.json({status: 'failed', message: error});
    }
})



router.get("/getComments/:id", auth, async(req, res)=>{
    try{
        const blogId = req.params.id;
        const handle = res.locals.handle;
        let query = `SELECT * FROM COMMENTS WHERE BLOG_ID = :blogId`;
        let result = await executeQuery(query, {blogId});
        if(result.rows.length == 0){
            throw "No such blog";
        }

        let comments = [];


        result.rows.forEach(c=>{
            comments.push(
                {
                    commentId: c[0],
                    blogId: c[1],
                    handle: c[2],
                    data: c[3],
                    time: c[4]
                }
            )
        })

        res.send({status: 'success', comments: comments});

    }catch(error){
        console.log(error);
		res.json({status: 'failed', message: error});
    }
})



router.get('/search', async (req, res)=>{
    try{
        const searchStr = req.body.searchStr;
        const query = `SELECT BLOG_ID, TITLE FROM BLOGS WHERE LOWER(TITLE) LIKE '%${searchStr}%'`;
        const result = await executeQuery(query, {});
        let blogs = [];
        result.rows.forEach(b=>{
            blogs.push({
                blogId: b[0],
				title: b[1]
            })
        })
        res.json({status: 'success', blogs: blogs});
    }catch(error){
        console.log(error);
        res.json({status: 'failure', message: error});
    }
})


router.post("/delete", auth, async(req, res)=>{
    try{
        const blogId = req.body.blogId;
        const handle = res.locals.handle;
        query = `DELETE FROM BLOGS WHERE BLOG_ID = :blogId AND HANDLE =:handle`;
        result = await executeQuery(query, {blogId, handle});
        res.json({status: 'success', message: result});
    }catch(err){
        res.json({status: 'failure', message: err})
        console.error(err);
    }
})


export default router;
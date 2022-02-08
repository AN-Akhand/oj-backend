import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';
import fs from 'fs';

const router = express.Router();
router.use(express.json());

router.get('/', async (req, res) => {
    console.log("list of problems");
    res.send("problems");
})

router.post('/create', auth, async(req, res) => {
    try{
        let problem = req.body;
        let dir = "contests/" + problem.contestId + "/" + problem.problemNo;
        if(!fs.existsSync(dir)){
            fs.mkdirSync(dir);
            fs.mkdirSync(dir + "/inputs");
            fs.mkdirSync(dir + "/outputs");
            fs.mkdirSync(dir + "/sampleInputs");
            fs.mkdirSync(dir + "/sampleOutputs");
        }
        fs.writeFile(dir + "/statement.md", problem.statement, (err, file)=>{
            if(err) throw err;
        })
        problem.sampleInputs.forEach(file => {
            fs.writeFile(dir + "/sampleInputs/" + file.fileName, file.data, (err, file) =>{
                if(err) throw err;
            })
        });
        problem.sampleOutputs.forEach(file => {
            fs.writeFile(dir + "/sampleOutputs/" + file.fileName, file.data, (err, file) =>{
                if(err) throw err;
            })
        });
        problem.inputs.forEach(file => {
            fs.writeFile(dir + "/inputs/" + file.fileName, file.data, (err, file) =>{
                if(err) throw err;
            })
        });
        problem.outputs.forEach(file => {
            fs.writeFile(dir + "/outputs/" + file.fileName, file.data, (err, file) =>{
                if(err) throw err;
            })
        });

        let s = "";
        problem.category.forEach(c=>{
            s = s + c + '/';
        })
        s = s.slice(0, -1);

        let query = `INSERT INTO problems(problem_id, contest_id, name, time_limit, memory_limit, difficulty, handle, categories) VALUES(:problemId, :contestId, :name, :timeLimit, :memoryLimit, :difficulty, :handle, :categories)`;
        let bind = {
            problemId: problem.problemNo,
            contestId: problem.contestId,
            name: problem.name,
            timeLimit: problem.timeLimit,
            memoryLimit: problem.memoryLimit,
            difficulty: problem.difficulty,
            handle: res.locals.handle,
            categories: s
        } 
        let result = await executeQuery(query, bind);
        console.log("Problem created successfully! may be :D")
        res.json({contestId: problem.contestId, problemNo: problem.problemNo});
    }catch(err){
        res.send(500);
        console.log(err);
    }
})

export default router;
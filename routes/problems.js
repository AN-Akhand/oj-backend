import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';
import fs from 'fs';
import {getSampleInputs, getSampleOutputs, getStatement} from '../util/fileIO.js'

const router = express.Router();
router.use(express.json());

router.get('/', async (req, res) => {
    console.log(req.body);
    try{
        let query = `SELECT problem_id, contest_id, name, categories, difficulty, tries, solves FROM problems `;
        if(req.body.category.length > 0){
            query = query + "WHERE ";
        }
        req.body.category.forEach(c=>{
            query = query + `LOWER(categories) LIKE LOWER('%${c}%') AND `;
        })
        if(req.body.category.length > 0){
            query = query.slice(0, -4);
        }
        query = query + `ORDER BY ${req.body.sortBy}`;
        let result = await executeQuery(query, {});
        let problems = [];
        result.rows.forEach(r=>{
            let categories = r[3].split('/');
            problems.push({
                problemNo: r[0],
                contestId: r[1],
                name: r[2],
                category: categories,
                difficulty: r[4],
                tries: r[5],
                solve: r[6]
            })
        })
        res.send(problems);
    }catch(err){
        console.log(err);
        res.json({status: 'failure', message: err})
    }
})

router.post('/contestProblem', async (req, res) => {
    console.log(req.body)
    const contestId = req.body.contestId;
    try{
        const query = `SELECT * FROM PROBLEMS WHERE CONTEST_ID = :contestId`;
        const result = await executeQuery(query, {contestId})
        const problems = []
        const numOfProblems = result.rows.length;
        for(let i=0; i<numOfProblems; i++){
            const problem = result.rows[i];
            problems.push({
                problemNo: problem[0],
                contestId: contestId,
                name: problem[8],
                difficulty: problem[7],
                tries: problem[6],
                solve: problem[9]
            })
        }
        res.json({status: 'success', message: problems})
    }catch (error){
        console.error(error)
        res.json({status: 'failure', message: error})
    }
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

router.post('/problemDetail', async (req, res) => {
    const contestId = req.body.contestId;
    const problemId = req.body.problemId;
    console.log(contestId, problemId)
    const query = `SELECT * FROM PROBLEMS WHERE PROBLEM_ID =: problemId AND CONTEST_ID = :contestId`;
    try{
        const result = await executeQuery(query, {problemId, contestId})

        if(result.rows.length !== 1){
            res.json({status:'failed', message: 'no such problem found'})
            return
        }
        const problem = result.rows[0];
        // console.log(result)
        const problemDetail = {
            name: problem[8],
            timeLimit: problem[1],
            memoryLimit: problem[2],
            statement: await getStatement(contestId, problemId),
            input: await getSampleInputs(contestId, problemId),
            output: await getSampleOutputs(contestId, problemId)
        }

        // console.log(problemDetail)
        res.json({status: 'success', problem: problemDetail})
    }catch (error){
        res.json({status: 'failed', message: error})
    }
})
export default router;
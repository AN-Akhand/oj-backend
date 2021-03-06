import express from 'express';
import auth from '../Middleware/auth.js';
import { executeQuery } from '../DB/executequery.js';
import fs from 'fs';
import {getSampleInputs, getSampleOutputs, getStatement, getSubmissionCode} from '../util/fileIO.js'
import oracledb from 'oracledb';
import {test} from './../util/compiler.js'
const router = express.Router();
router.use(express.json());

router.post('/getTutorial', async (req, res) => {
	const {contestId, problemNo} = req.body;
	try{
		const query = `SELECT BLOG_ID FROM TUTORIALS WHERE CONTEST_ID = :contestId AND PROBLEM_ID = :problemNo`;
		const result = await executeQuery(query, {contestId, problemNo});
		console.log(result);
		if(result.rows.length === 0) res.json({status: 'failed', message: 'no tutorial found'});
		else res.json({status: 'success', blogId: result.rows[0][0]});
	}catch (err){
		res.json({status: 'success', message: 'server error!'});
	}
})

router.post('/get', async (req, res) => {
	// console.log('eitay ashe!')
	console.log(req.body);
	try{
		let query = `SELECT p.problem_id, p.contest_id, p.name, p.categories, p.difficulty, p.tries, p.solves 
					FROM problems p JOIN contests c ON (p.contest_id = c.contest_id AND c.start_time < ${Date.now()}) `;
		if(req.body.category.length > 0){
			query = query + "WHERE ";
			req.body.category.forEach(c=>{
				query = query + `LOWER(categories) LIKE LOWER('%${c}%') AND `;
			})
			query += '1 = 1';
		}
		if(req.body.sortBy) query = query + `ORDER BY ${req.body.sortBy}`;
		// console.log(query)
		let result = await executeQuery(query, {});
		let problems = [];
		result.rows.forEach(r=>{
			let categories = r[3] == null ? [] : r[3].split('/');
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
		res.json({status: 'success', message: {problems}});
	}catch(err){
		console.log(err);
		res.json({status: 'failure', message: err})
	}
})

router.post('/contestProblem', auth, async (req, res) => {
	console.log(req.body)
	const contestId = req.body.contestId;
	const handle = res.locals.handle;
	try{
		let query = `SELECT HANDLE, START_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId`;
		const contestDetails = await executeQuery(query, {contestId});
		if(contestDetails.rows[0][0] != handle && Date.now() < contestDetails.rows[0][1]){
			throw "Not Allowed";
		}
		query = `SELECT * FROM PROBLEMS WHERE CONTEST_ID = :contestId`;
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
		console.log(req.body);
		const userHandle = res.locals.handle;
		let contestId = req.body.contestId;
		let problem = req.body;
		let query = `SELECT HANDLE, START_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId`;
		const contestDetails = await executeQuery(query, {contestId});
		if(contestDetails.rows[0][0] != userHandle || contestDetails.rows[0][1] < Date.now()){
			throw "Not Allowed";
		}
		query = `SELECT problem_id from problems where contest_id = :contestId and problem_id =: problemNo`;
		const problemQuery = await executeQuery(query, {contestId, problemNo: problem.problemNo});
		if(problemQuery.rows.length !== 0){
			res.json({status: 'failure', message: 'problem no should be unique!'});
			return;
		}
		
		let dir = "contests/" + problem.contestId + "/" + problem.problemNo;
		if(!fs.existsSync(dir)){
			fs.mkdirSync(dir);
			fs.mkdirSync(dir + "/inputs");
			fs.mkdirSync(dir + "/outputs");
			fs.mkdirSync(dir + "/sampleInputs");
			fs.mkdirSync(dir + "/sampleOutputs");
			fs.mkdirSync(dir + "/submission");
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

		query = `INSERT INTO problems(problem_id, contest_id, name, time_limit, memory_limit, difficulty, handle, categories) VALUES(:problemId, :contestId, :name, :timeLimit, :memoryLimit, :difficulty, :handle, :categories)`;
		let bind = {
			problemId: problem.problemNo,
			contestId: problem.contestId,
			name: problem.name,
			timeLimit: problem.timeLimit,
			memoryLimit: problem.memoryLimit,
			difficulty: problem.difficulty,
			handle: userHandle,
			categories: s
		}
		let result = await executeQuery(query, bind);
		console.log("Problem created successfully! may be :D")
		res.json({status: 'success', message: {contestId: problem.contestId, problemNo: problem.problemNo}});
	}catch(err){
		res.json({status: 'failure', message: err});
		console.log(err);
	}
})



router.post("/delete", auth, async(req, res)=>{
    try{
        const contestId = req.body.contestId;
		const problemId = req.body.problemId;
        const handle = res.locals.handle;
        let query = `SELECT START_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId AND HANDLE = :handle`;
        let result = await executeQuery(query, {contestId, handle});
        if(result.rows.length == 0){
            throw "Contest is running!";
        }
        if(result.rows[0][0] < Date.now()){
            throw "Contest already finished!";
        }
        query = `DELETE FROM PROBLEMS WHERE CONTEST_ID = :contestId AND PROBLEM_ID =:problemId`;
        result = await executeQuery(query, {contestId, problemId});
        fs.rmSync("contests/" + contestId + "/" + problemId, {recursive: true});
        res.json({status: 'success', message: result});
    }catch(err){
        res.json({status: 'failure', message: err})
        console.error(err);
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

router.post('/submission', auth, async (req, res) => {
	try{
		const contestId = req.body.contestId;
		const problemId = req.body.problemId;
		const submissionId = req.body.submissionId;
		const handle = res.locals.handle;
		let query = `SELECT END_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId`;
		let result = await executeQuery(query, {contestId});
		const endTime = result.rows[0][0];
		query = `SELECT * FROM SUBMISSIONS WHERE PROBLEM_ID =: problemId AND CONTEST_ID = :contestId AND submission_id = :submissionId`;
		result = await executeQuery(query, {problemId, contestId, submissionId})
		console.log(result)
		if(endTime > Date.now() && handle != result.rows[0][0]){
			throw "Not Allowed";
		}
		const code = await getSubmissionCode(contestId, problemId, submissionId)
		// console.log(code)
		const submission = {
			submissionId,
			submissionTime: result.rows[0][6],
			verdict: result.rows[0][7],
			verdictDetail: result.rows[0][8],
			code
		}
		res.json({status: 'success', message: {submission}})
	}catch(error){
		console.log(err);
		res.json({status: 'failed', message: err});
	}
});


router.post("/user-submissions", auth, async (req, res)=>{
	try{
		const handle = req.body.handle;
		const query = `SELECT S.*, P.NAME FROM SUBMISSIONS S JOIN PROBLEMS P 
						ON(S.CONTEST_ID = P.CONTEST_ID AND S.PROBLEM_ID = P.PROBLEM_ID) 
						WHERE S.HANDLE = :handle`;
		const result = await executeQuery(query, {handle});
		let subs = [];
		result.rows.forEach(s=>{
			subs.push(
				{
					problemId: s[1],
					contestId: s[2],
					submissionId: s[3],
					time: s[4],
					memory: s[5],
					subTime: s[6],
					verdict: s[7],
					name: s[9]
				}
			)
		})
		res.json({status: 'success', message: subs});
	}catch(error){
		console.log(err);
		res.json({status: 'failed', message: err});
	}
});


router.post('/submit', auth, async (req, res)=>{
	try{
		let sub = req.body;
		console.log(sub);
		let handle = res.locals.handle;
		let contestId = sub.contestId;
		let problemId = sub.problemId;
		let subTime = sub.time;

		let query = `SELECT HANDLE, END_TIME FROM CONTESTS WHERE CONTEST_ID = :contestId`;
		let result = await executeQuery(query, {contestId});
		if(handle == result.rows[0][0] && Date.now() < result.rows[0][1]){
			throw "Not Allowed";
		}
		query = `BEGIN 
						insert_sub(:handle, :contestId, :problemId, :subTime, :id);
					END;`;
		result = await executeQuery(query, {handle, contestId, problemId, subTime, id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }});
		let subId = result.outBinds.id;
		let dir = "contests/" + sub.contestId + "/" + sub.problemId + "/submission";
		if(!fs.existsSync(dir)){
			fs.mkdirSync(dir);
		}
		fs.writeFile(dir + "/"+subId+".cpp", sub.code, (err, file) =>{
			if(err) throw err;
		});

		const getTimeLimit = `SELECT TIME_LIMIT FROM PROBLEMS WHERE PROBLEM_ID =: problemId AND CONTEST_ID = :contestId`;
		result = await executeQuery(getTimeLimit, {problemId, contestId})
        console.log(result.rows)
		if(result.rows.length !== 1){
			res.json({status: 'failed', reason: 'no such problem found'})
		}
		const timeLimit = result.rows[0][0] * 1000;
		console.log(timeLimit)
		let verdict = '';
		test(subId, contestId, problemId, timeLimit).then(async finalVerdict => {
			console.log(finalVerdict)
			verdict = finalVerdict.verdict;
			let detail = 'AC';
			if(finalVerdict.verdict !== 'AC') detail = finalVerdict.reason.substr(0, 1999);
			console.log(detail);
			query = `UPDATE SUBMISSIONS SET VERDICT = :verdict, VERDICT_DETAIL = :detail WHERE SUBMISSION_ID = :subId`;
			result = await executeQuery(query, {verdict, detail, subId});
			await checkAndUpdateContestStanding(problemId, contestId, subTime, handle, finalVerdict.verdict)
			if(verdict == 'AC'){
				query = `UPDATE PROBLEMS SET TRIES = TRIES + 1, SOLVES = SOLVES + 1 
				WHERE CONTEST_ID = :contestId AND PROBLEM_ID = :problemId`;
			}
			else{
				query = `UPDATE PROBLEMS SET TRIES = TRIES + 1 WHERE CONTEST_ID = :contestId AND PROBLEM_ID = :problemId`;
			}
			result = await executeQuery(query, {contestId, problemId});
		});

		res.json({status: 'success', message: {verdict: 'testing', submissionId: subId}})
    }catch(err){
		console.log(err);
		res.json({status: 'failed', message: err});
	}
})

async function checkAndUpdateContestStanding(problemId, contestId, subTime, handle, verdict) {
	let query = `SELECT HANDLE FROM SUBMISSIONS WHERE CONTEST_ID = :contestId AND PROBLEM_ID = :problemId AND HANDLE = :handle AND LOWER(VERDICT) = 'ac'`;
	let result = await executeQuery(query, {contestId, problemId, handle});
	if(result.rows.length > 1){
		return;
	}
	query = `SELECT end_time, start_time FROM CONTESTS WHERE contest_id = :contestId`;
	let contest = await executeQuery(query, {contestId});
	let endTime = contest.rows[0][0];
	let startTime = contest.rows[0][1];
	if(!endTime) return;
	if (parseInt(endTime) > parseInt(subTime)) {
		query = `SELECT handle FROM standings WHERE CONTEST_ID = :contestId AND handle = :handle`;
		result = await executeQuery(query, {contestId, handle});
		if (result.rows.length === 0) {
			query = `INSERT INTO standings(contest_id, handle) VALUES(:contestId, :handle)`;
			result = executeQuery(query, {contestId, handle});
		}
		let penalty = (parseInt(subTime) - startTime) / (endTime - startTime) * 50;
		if (verdict == 'AC') {
			query = `UPDATE standings SET penalty = penalty + :penalty, ac_problems = ac_problems + 1 
						WHERE contest_id = :contestId AND handle = :handle`;
			result = await executeQuery(query, {penalty, contestId, handle});
		} else {
			query = `UPDATE standings SET wrong_subs = wrong_subs + 1, penalty = penalty + 50 
						WHERE contest_id = :contestId AND handle = :handle`;
			result = await executeQuery(query, {contestId, handle});
		}
	}
}



router.get('/search', async (req, res)=>{
    try{
        const searchStr = req.body.searchStr;
        const query = `SELECT PROBLEM_ID, CONTEST_ID, NAME FROM PROBLEMS WHERE LOWER(NAME) LIKE '%${searchStr}%'`;
        const result = await executeQuery(query, {});
        let problems = [];
        result.rows.forEach(p=>{
            problems.push({
                problemId: p[0],
                contestId: p[1],
				name: p[2]
            })
        })
        res.json({status: 'success', problems: problems});
    }catch(error){
        console.log(error);
        res.json({status: 'failure', message: error});
    }
})


export default router;
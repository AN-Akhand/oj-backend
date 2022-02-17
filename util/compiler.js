import fs from 'fs';
import kill from 'tree-kill';
import childProcess from 'child_process';

// test("tle", "69", "3", 1000)
//     .then(res => {
//         console.log(res)
//     })

export async function test(submissionID, contestID, problemID, timeLimit) {
    const problemDir = "contests/{CONTEST_ID}/{PROBLEM_ID}/".replace("{CONTEST_ID}", contestID).replace("{PROBLEM_ID}", problemID);
    const numOfTestCase = fs.readdirSync(problemDir+'inputs').length
    const compilationCommand = "g++ -O2 -std=c++14 \"" + problemDir + "submission/" +submissionID + ".cpp\" -o " + problemDir + "submission/main";
    const compile = childProcess.spawnSync(compilationCommand, {shell: true});
    if (compile.status === 1) {
        return {verdict: 'Compilation Error', reason: compile.output.toString()}
    } else {
        return await meoRun(submissionID, problemDir, numOfTestCase, timeLimit)
    }
}

async function meoRun(submissionID, directory, numOfTestCase, timeLimit) {
    const finalVerdict = {verdict: 'AC', tests: []};
   // console.log('testing '+submissionID)
    for (let i = 0; i < numOfTestCase; i++) {
     //   console.log('test: '+(i+1))
        let testInput = directory + "inputs/test_input";
        let testAcc = directory + "outputs/test_output";
        let userOut = directory + "testFiles/" + submissionID + "_out";
        if(!fs.existsSync(directory+'testFiles')) fs.mkdirSync(directory+'testFiles');
        if (i) {
            testInput += " (" + i + ")";
            testAcc += " (" + i + ")";
            userOut += " (" + i + ")";
        }
        testInput += ".txt";
        testAcc += ".txt";
        userOut += ".txt";

        let d1 = Date.now();
        let runCommand = "\"" + directory + "submission/main\" < \"" + testInput + "\" > \"" + userOut + "\"";
        runCommand.replace("/", "\\");
        const verdict = {verdict: "", testNo: i + 1};
        const promise = new Promise((res, rej) => {
            const testOn = childProcess.spawn(runCommand, {shell: true})
            setTimeout(async () => {
                await kill(testOn.pid, 'SIGKILL', (data) => {
                    //console.log("data: " + data);
                    if (data == null)  res('TLE');
                    else res('NO TLE');
                })
                // console.log(verdict)
            }, timeLimit*1.5)
        })
        const res = await promise;
        // console.log(i+' res: ');
        if(res !== 'TLE'){
            const meoResult = meoFC(userOut, testAcc);
            verdict.verdict = meoResult.verdict;
            if(meoResult.verdict === 'WA') {
                res.reason = meoResult.reason;
                finalVerdict.verdict = 'WA';
                finalVerdict.reason = 'WA on test: '+(i+1)
            }
        }else {
            finalVerdict.verdict = 'TLE';
            finalVerdict.reason = 'TLE on test: '+(i+1)
        }
        // console.log(verdict)
        finalVerdict.tests.push(verdict)
        if(verdict.verdict !== 'AC') break;
    }
    //console.log(finalVerdict)
    return finalVerdict
}


function meoFC(file1, file2){
    // console.log(file1)
    // console.log(file2)
    const lines1 = fs.readFileSync(file1, 'utf-8').split('\n');
    const lines2 = fs.readFileSync(file2, 'utf-8').split('\n');
    if (lines2 === lines1) console.log("AC");
    else{
        const len1 = lines1.length;
        const len2 = lines2.length;

        if(len1 !== len2){
            const dif = len1 - len2;
            const flag = ((dif === 1) && lines1[len1-1].trim() === "") || ((dif === -1) && lines2[len2-1].trim() === "")
            // console.log('mismatched line number!')
            if(!flag) return {
                verdict: "WA",
                reason: "Mismatched line number of accepted and output file"
            };
        }

        for(let i=0; i<len1; i++){
            if(lines1[i].trim() !== lines2[i].trim()){
                return {
                    verdict: "WA",
                    reason: `Mismatched at line ${i+1}`
                };
            }
        }
        return {
            verdict: "AC"
        };
    }

}
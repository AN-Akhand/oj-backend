import fs from "fs";
import e from "express";

export async function getSampleInputs(contestId, problemId) {
    return await readFromDirectory(contestId, problemId, 'sampleInputs')
}

export async function getSampleOutputs(contestId, problemId) {
    return await readFromDirectory(contestId, problemId, 'sampleOutputs')
}

export async function getStatement(contestId, problemId){
    return fs.readFileSync('./contests/'+contestId+'/'+problemId+'/statement.md', {encoding: 'utf8', flag: 'r'})
}
async function readFromDirectory(contestId, problemId, iOrO) {
    const directory = './contests/'+contestId+'/'+problemId+'/'+iOrO
    const files = await getTextFiles(directory)
    const outputs = []
    files.forEach(file => {
        const ss = file.split('/')
        const ssLen = ss.length;
        const fileName = ss[ssLen - 1];
        const fileSS = fileName.split('.')[0].split(' ');
        let key;
        if (fileSS.length === 1) key = 0;
        else key = parseInt(fileSS[1].replace('(', '').replace(')', ''))

        const text = fs.readFileSync(file, {encoding: 'utf8', flag: 'r'})
        outputs.push({key, text})
    })
    return outputs;
}

async function getFilesFromDirectory(file){
    return new Promise((res, rej) => {
        fs.readdir(file, (err, files) => {
            if(err) return rej(err)
            return res(files)
        })
    })
}

async function getTextFiles(filePath) {
    let files = await getFilesFromDirectory(filePath)
    let txtFiles = []
    files.forEach(file=>{
        const ss = file.split('.')
        const n = ss.length;
        if(ss[n-1] === 'txt') txtFiles.push(filePath+'/'+file);
    })
    return txtFiles;
}

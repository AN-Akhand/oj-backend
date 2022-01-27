import dotenv from 'dotenv';
import oracledb from 'oracledb';
dotenv.config();
oracledb.autoCommit = true;

export async function executeQuery(query, values){
    let conn;
    try{
        conn = await oracledb.getConnection({user: process.env.DB_USER, password: process.env.DB_PASSWORD, connectionString: process.env.DB_CONN_STRING});
        let result = await conn.execute(query, values);
        return result;
    }catch(err) {
        throw err;
    }finally{
        try{
            conn.close();
        }catch(err){
            throw err;
        }
    }
}
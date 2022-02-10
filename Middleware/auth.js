import dotenv from 'dotenv';
import jwt from 'jsonwebtoken';
dotenv.config();

function auth(req, res, next){
    try{
        const token = req.headers.authorization.split(' ')[1];
        const decodedToken = jwt.verify(token, process.env.SECRET_KEY);
        res.locals.handle = decodedToken.handle;
        next();
    }catch(err){
        console.error(err);
        res.json({status: 'failure', message: 'Login first!'});
    }
}
export default auth;
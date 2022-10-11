import { connection } from "../db/db.js"
import { registerSchema, loginSchema} from "../schemas/authSchema.js"
import { v4 as uuid } from "uuid"
import bcrypt from "bcrypt"

async function register(req, res){
    let { name, email, password, confirmPassword } = req.body
    const isValid = registerSchema.validate({name, email, password, confirmPassword})

    if(isValid.error){
        return res.sendStatus(422)
    }

    if( password != confirmPassword ){
        return res.sendStatus(400)
    }

    password = bcrypt.hashSync(password, 10)

    try{
        const query = await connection.query('INSERT INTO users (name, email, password) VALUES ($1,$2,$3);',[name, email, password])
        return res.sendStatus(201)

    } catch(error) {
        if(error.code === "23505"){
            return res.sendStatus(409)
        }
        return res.sendStatus(500)
    }
}

async function login(req,res){
    const token = uuid()
    const { email, password } = req.body
    const isValid = loginSchema.validate({email, password})
    let userId

    if(isValid.error){
        return res.sendStatus(422)
    }

    try{
        const query = await connection.query('SELECT * FROM users WHERE email = $1;',[email])
        const isPasswordValid = bcrypt.compareSync(password, query.rows[0].password)
        userId = query.rows[0].id

        if(!isPasswordValid){
            return res.sendStatus(401)
        }

    } catch(error) {
        return res.sendStatus(500)
    }

    try{
        const query = await connection.query('INSERT INTO sessions (token,userId) VALUES ($1, $2);',[token, userId])
        return res.send(token)
    } catch(error){
        console.log(error)
        res.sendStatus(500)
    }

    return res.sendStatus(200)
}

export { register, login }
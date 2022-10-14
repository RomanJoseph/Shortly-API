import { connection } from "../db/db.js";
import { nanoid } from "nanoid"
import { urlSchema } from "../schemas/urlSchema.js"

function shortUrl (req,res) {
    const { userid } = res.locals.session
    const { url } = req.body
    const isValidUrl = urlSchema.validate(req.body)
    console.log(isValidUrl)
    const short = String(nanoid(8))

    if(isValidUrl.error){
        console.log(isValidUrl.error)
        return res.sendStatus(422)
    }

    try{
        const query = connection.query('INSERT INTO urls (shorturl, url, userid) VALUES ($1, $2, $3);',[short, url, userid])
        return res.status(201).send({shorUrl:short})
    }catch(error){
        console.log(error)
        res.sendStatus(500)
    }

    return res.send(res.locals.session)
}

export { shortUrl }
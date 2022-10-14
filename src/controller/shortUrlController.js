import { connection } from "../db/db.js";
import { nanoid } from "nanoid"
import { urlSchema } from "../schemas/urlSchema.js"

async function shortlyUrl(req, res) {
    const { userid } = res.locals.session
    const { url } = req.body
    const isValidUrl = urlSchema.validate(req.body)
    const short = String(nanoid(8))

    if (isValidUrl.error) {
        console.log(isValidUrl.error)
        return res.sendStatus(422)
    }

    try {
        const query = await connection.query('INSERT INTO urls (shorturl, url, userid) VALUES ($1, $2, $3);', [short, url, userid])
        return res.status(201).send({ shorUrl: short })
    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }

    return res.send(res.locals.session)
}

async function urlById(req, res) {
    const { id } = req.params

    try {
        const query = await connection.query('SELECT * FROM urls WHERE id=$1', [id])
        return res.send(query.rows[0])
    } catch (error) {
        return res.status(500).send(error)
    }
}

async function openUrl(req, res) {
    const { shortUrl } = req.params

    try {
        const query = await connection.query('SELECT url FROM urls WHERE shorturl=$1;', [shortUrl])

        if (query.rows.length === 0) {
            return res.sendStatus(404)
        }

        const updateViewCount = await connection.query('UPDATE urls SET visitcount = visitcount + 1 WHERE shorturl=$1;', [shortUrl])

        return res.redirect(query.rows[0].url)
    } catch (error) {
        console.log(error)
        return res.status(500).send(error)
    }
}

async function deleteUrl(req, res) {
    const { token, userid } = res.locals.session
    const { id } = req.params

    console.log(res.locals)

    try {
        const query = await connection.query('SELECT id FROM urls WHERE id = $1;', [id])
        if (query.rows.length === 0) {
            return res.sendStatus(404)
        }
    } catch (error) {
        return res.send(error)
    }

    try {
        const query = await connection.query('DELETE FROM urls WHERE id=$1 AND userid=$2;', [id, userid])

        return res.sendStatus(204)
    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }

    return res.sendStatus(200)
}

async function userData(req, res) {
    const { userid, name } = res.locals.session
    
    const user = {
        id: userid,
        name,
    }


    try {
        const visitCounter = await connection.query('SELECT SUM(visitcount) AS visitCount FROM urls WHERE userid=$1;', [userid])
        const shortedUrls = await connection.query('SELECT id, shorturl, url, visitcount FROM urls WHERE userid=$1;',[userid])
        user.visitCount = visitCounter.rows[0].visitcount
        user.shortenedUrls = shortedUrls.rows

        return res.send(user)
    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}

export { shortlyUrl, urlById, openUrl, deleteUrl, userData }
import express from "express"
import cors from "cors"

const server = express();
server.use(cors())
server.use(express.json())

server.get("/status", (req, res) => res.sendStatus(200))

server.listen(4000, () => "A mágica acontece no 4000")
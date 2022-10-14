import express, { application } from "express"
import cors from "cors"
import { connection } from "./db/db.js";
import authRoutes from "./routes/authRoute.js"
import shortUrlRoutes from "./routes/shortUrlRoute.js"

const server = express();
server.use(cors())
server.use(express.json())

server.get("/status", (req, res) => res.sendStatus(200))

server.use(authRoutes)
server.use(shortUrlRoutes)

server.listen(4000, () => "A mágica acontece no 4000")
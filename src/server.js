import express from "express"
import cors from "cors"
import authRoutes from "./routes/authRoute.js"
import shortUrlRoutes from "./routes/shortUrlRoute.js"
import dotenv from "dotenv"

const server = express();
dotenv.config()
server.use(cors())
server.use(express.json())

server.get("/status", (req, res) => res.sendStatus(200))

server.use(authRoutes)
server.use(shortUrlRoutes)

server.listen(process.env.PORT, () => `A mágica acontece no ${process.env.PORT}`)
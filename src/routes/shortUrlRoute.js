import express from "express";
import { shortUrl } from "../controller/shortUrlController.js";
import { authMiddleware } from "../middleware/authMiddleware.js"
const router = express.Router()

router.post("/urls/shorten", authMiddleware, shortUrl)

export default router
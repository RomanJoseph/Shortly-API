import express from "express";
import { deleteUrl, openUrl, ranking, shortlyUrl, urlById, userData } from "../controller/shortUrlController.js";
import { authMiddleware } from "../middleware/authMiddleware.js"
const router = express.Router()

router.post("/urls/shorten", authMiddleware, shortlyUrl)
router.get("/urls/:id", urlById)
router.get("/urls/open/:shortUrl", openUrl)
router.delete("/urls/:id",authMiddleware, deleteUrl)
router.get("/users/me", authMiddleware, userData)
router.get("/ranking", ranking)

export default router
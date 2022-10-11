import express from "express";
import { login, register } from "../controller/authController.js";

const router = express.Router()

router.post("/sing-up",register)
router.post("/sing-in", login)

export default router
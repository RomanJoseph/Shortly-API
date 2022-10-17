import express from "express";
import { login, register } from "../controller/authController.js";

const router = express.Router()

router.post("/sign-up",register)
router.post("/sign-in", login)

export default router
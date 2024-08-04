import express from "express";
import { createProject } from "../controllers/project.controller.js";
import { upload } from "../middlewares/multer.middleware.js";

const router = express.Router();


router.post("/create",upload.array('images'),createProject);

export default router
import express from "express";
import { createProject,sentListOfProject } from "../controllers/project.controller.js";
import { upload } from "../middlewares/multer.middleware.js";

const router = express.Router();


router.post("/create",upload.array('images'),createProject);
router.get("/list",sentListOfProject);


export default router
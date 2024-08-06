import express from "express";
import { createProject,getProjectById,sentListOfProject } from "../controllers/project.controller.js";
import { upload } from "../middlewares/multer.middleware.js";

const router = express.Router();


router.post("/create",upload.array('images'),createProject);
router.get("/list",sentListOfProject);
router.get("/get",getProjectById);


export default router
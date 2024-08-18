import express from "express";
import { upload } from "../middlewares/multer.middleware.js";
import { verifyJWT } from "../middlewares/auth.middleware.js";
import { getUserDetails, loginUser, logoutUser, refreshAccessToken, registerUser, validateAccessToken } from "../controllers/user.controller.js";

const router = express.Router();

router.post("/register", upload.single("avatar"), registerUser);
router.post("/login", loginUser);
router.post("/logout",verifyJWT, logoutUser);
router.post("/refresh-token",refreshAccessToken);
router.post("/validate-token",validateAccessToken);
router.get("/getUser",getUserDetails);


export default router;

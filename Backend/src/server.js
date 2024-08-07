import express, { text } from 'express';
import { logger, logEvents } from './middlewares/logger.js';
import ErrorHandler from './middlewares/errorHandler.js';
import cors from 'cors';
import { corsoptions } from './config/corsOptions.js';
import dotenv from 'dotenv';
import cookieParser from 'cookie-parser';



dotenv.config();

const app = express();
const port = process.env.PORT || 3000;


app.use(logger);
app.use(cors(corsoptions));
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
app.use('/', express.static("public"));
app.use(cookieParser());

//router import 
import userRouter from './routes/user.router.js';
import ProjectRouter from './routes/project.router.js';
import RoomRouter from './routes/room.router.js';

//router declaration
app.use('/api/v1/users', userRouter);
app.use('/api/v1/project',ProjectRouter)
app.use('/api/v1/room',RoomRouter)



app.use(ErrorHandler);




app.listen(port, () => {
    console.log(`Server is activated and running on port ${port}`);
});


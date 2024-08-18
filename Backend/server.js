import express, { text } from 'express';
import { logger, logEvents } from './src/middlewares/logger.js';
import ErrorHandler from './src/middlewares/errorHandler.js';
import cors from 'cors';
import { corsoptions } from './src/config/corsOptions.js';
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
import userRouter from './src/routes/user.router.js';

//router declaration
app.use('/api/v1/users', userRouter);
    


app.use(ErrorHandler);




app.listen(port, () => {
    console.log(`Server is activated and running on port ${port}`);
});


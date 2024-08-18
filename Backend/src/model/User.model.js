import { PrismaClient } from '@prisma/client';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

const prisma = new PrismaClient();

export const createUser = async ({ name, email, password, avatarUrl }) => {
    const hashedPassword = await bcrypt.hash(password, 10);
    return prisma.users.create({
        data: {
            name,
            email,
            password: hashedPassword,
            avatarUrl
        }
    });
};

export const findUserByEmail = async (email) => {
    if(!email){
        console.log("no emial")
    }
    return prisma.users.findUnique({
        where: { email },
        select: { password: true, refreshToken: true, id: true, name: true, email: true }
    });
};

export const findUserById = async (id) => {
    const userid = parseInt(id); 
    return prisma.users.findUnique({
        where: { id:userid },
        select: { id: true, name: true, email: true, avatarUrl: true, refreshToken: true }
    });
};

export const updateUserRefreshToken = async (id, refreshToken) => {
    return prisma.users.update({
        where: { id },
        data: { refreshToken }
    });
};

export const clearUserRefreshToken = async (id) => {
    return prisma.users.update({
        where: { id },
        data: { refreshToken: null }
    });
};

export const comparePassword = async (inputPassword, hashedPassword) => {
    return bcrypt.compare(inputPassword, hashedPassword);
};

export const generateAccessToken = (user) => {
    return jwt.sign(
        { id: user.id, email: user.email, name: user.name },
        process.env.ACCESS_TOKEN_SECRET,
        { expiresIn: process.env.ACCESS_TOKEN_EXPIRY }
    );
};

export const generateRefreshToken = (user) => {
    return jwt.sign(
        { id: user.id },
        process.env.REFRESH_TOKEN_SECRET,
        { expiresIn: process.env.REFRESH_TOKEN_EXPIRY }
    );
};

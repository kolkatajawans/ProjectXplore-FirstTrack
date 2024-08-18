import prisma from "../db/prismaClient.js"

export const getRoleId = async(label)=>{
    const response = await prisma.roles.findUnique({
        where:{
            label:label
        }
    })
    return response.role_id
}
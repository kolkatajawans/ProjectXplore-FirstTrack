import { PrismaClient } from '@prisma/client';
import { ApiError } from '../utils/ApiError.js';
import { asyncHandler } from '../utils/asyncHandler.js';
import { uploadOnCloudinary } from '../utils/cloudinary.js';
const prisma = new PrismaClient();

const createProject = asyncHandler(async (req, res, next) => {
  const { userId, name, description, links : linksString, roomId } = req.body; // Extract roomId from req.body if needed
  const images = req.files;

  console.log(typeof links);

  // Validate the input data
  if (!userId || !name || !description) {
    return res.status(400).json({ message: 'Please provide all required fields' });
  }

  const authorId = parseInt(userId, 10);
  if (isNaN(authorId)) {
    return next(new ApiError(400, 'Invalid user ID'));
  }

  try {
    // Create a new project
    const project = await prisma.project.create({
      data: {
        authorId,        // Correctly use authorId
        name,
        description,
        roomId: roomId ? parseInt(roomId, 10) : null, // Optionally handle roomId if provided
      },
    });

    // Upload images to Cloudinary and create image records
    const imageRecords = [];
    for (const image of images) {
      const avatarUrl = await uploadOnCloudinary(image.path);
      imageRecords.push({
        url: avatarUrl.url,
        projectId: project.id,
      });
    }

    // Create image records in the database
    await prisma.image.createMany({
      data: imageRecords,
    });

    let links = [];
  try {
    if (linksString) {
      links = JSON.parse(linksString); // Convert JSON string to array
    }
  } catch (error) {
    return next(new ApiError(400, 'Invalid links format'));
  }

  if (!Array.isArray(links)) {
    return next(new ApiError(400, 'Links should be an array'));
  }


    // Create link records
    const linkRecords = links.map((link) => ({
      url: link,
      projectId: project.id,
    }));

    // Create link records in the database
    await prisma.link.createMany({
      data: linkRecords,
    });

    return res.status(201).json({ message: 'Project created successfully' });
  } catch (error) {
    console.error(error);
    return next(new ApiError(500, 'Error creating project')); // Correctly use `new ApiError()`
  }
});
const sentListOfProject = asyncHandler(async (req,res,next)=>{
  const {userId} = req.query;
  const authorId = parseInt(userId, 10);
  if (isNaN(authorId)) {
    return next(new ApiError(400, 'Invalid user ID'));
  }
  try {
    const data =await prisma.project.findMany({
      where:{
        authorId,
      },
    });
    console.log(data);
    return res.status(201).json(data);
  } catch (error) {
    console.log(error);
    return next(new ApiError(500, 'Error retrieving project')); 
  }
})

const getProjectById = asyncHandler(async(req,res,next)=>{

  const { projectId } = req.query

  try {
    const project = await prisma.project.findUnique({
      where: { id: Number(projectId) },
      include: {
        author: true,   // Includes author details
        room: true,     // Includes room details if exists
        links: true,    // Includes project links
        images: true,   // Includes project images
      },
    });

    if (!project) {
      return res.status(404).json({ message: 'Project not found' });
    }

    res.json(project);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
}) 




export { createProject,sentListOfProject,getProjectById };

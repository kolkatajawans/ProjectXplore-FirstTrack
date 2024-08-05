import { PrismaClient } from '@prisma/client';
import { uploadOnCloudinary } from '../utils/cloudinary.js';
import { ApiError } from '../utils/ApiError.js';
import { asyncHandler } from '../utils/asyncHandler.js';
const prisma = new PrismaClient();

const createProject = asyncHandler(async (req, res, next) => {
  const { userId, name, description, links } = req.body; // Use req.body instead of req.query
  const images = req.files;
    console.log(userId, name, description, links, images);
    
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
        authorId,
        name,
        description,
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
    throw new next(ApiError(500,'Error creating project'));
  }
});

export {createProject}
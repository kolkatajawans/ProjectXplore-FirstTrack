/*
  Warnings:

  - You are about to drop the `Comment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CommentLike` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Follower` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Image` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Link` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Project` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectLike` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Request` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Room` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RoomMember` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Task` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_authorId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_projectId_fkey";

-- DropForeignKey
ALTER TABLE "CommentLike" DROP CONSTRAINT "CommentLike_commentId_fkey";

-- DropForeignKey
ALTER TABLE "CommentLike" DROP CONSTRAINT "CommentLike_userId_fkey";

-- DropForeignKey
ALTER TABLE "Follower" DROP CONSTRAINT "Follower_followerId_fkey";

-- DropForeignKey
ALTER TABLE "Follower" DROP CONSTRAINT "Follower_followingId_fkey";

-- DropForeignKey
ALTER TABLE "Image" DROP CONSTRAINT "Image_projectId_fkey";

-- DropForeignKey
ALTER TABLE "Link" DROP CONSTRAINT "Link_projectId_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_authorId_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_roomId_fkey";

-- DropForeignKey
ALTER TABLE "ProjectLike" DROP CONSTRAINT "ProjectLike_projectId_fkey";

-- DropForeignKey
ALTER TABLE "ProjectLike" DROP CONSTRAINT "ProjectLike_userId_fkey";

-- DropForeignKey
ALTER TABLE "Request" DROP CONSTRAINT "Request_roomId_fkey";

-- DropForeignKey
ALTER TABLE "Room" DROP CONSTRAINT "Room_authorId_fkey";

-- DropForeignKey
ALTER TABLE "RoomMember" DROP CONSTRAINT "RoomMember_roomId_fkey";

-- DropForeignKey
ALTER TABLE "RoomMember" DROP CONSTRAINT "RoomMember_userId_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_assignId_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_authorId_fkey";

-- DropTable
DROP TABLE "Comment";

-- DropTable
DROP TABLE "CommentLike";

-- DropTable
DROP TABLE "Follower";

-- DropTable
DROP TABLE "Image";

-- DropTable
DROP TABLE "Link";

-- DropTable
DROP TABLE "Project";

-- DropTable
DROP TABLE "ProjectLike";

-- DropTable
DROP TABLE "Request";

-- DropTable
DROP TABLE "Room";

-- DropTable
DROP TABLE "RoomMember";

-- DropTable
DROP TABLE "Task";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "achievements" (
    "achievement_id" SERIAL NOT NULL,
    "team_id" INTEGER,
    "achievement_name" VARCHAR(255) NOT NULL,
    "achievement_description" TEXT,
    "image_link" TEXT,
    "useful_link" TEXT,

    CONSTRAINT "achievements_pkey" PRIMARY KEY ("achievement_id")
);

-- CreateTable
CREATE TABLE "answers" (
    "answer_id" SERIAL NOT NULL,
    "issue_id" INTEGER,
    "user_id" INTEGER,
    "answer_text" TEXT,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "votes" INTEGER DEFAULT 0,
    "is_accepted" BOOLEAN DEFAULT false,

    CONSTRAINT "answers_pkey" PRIMARY KEY ("answer_id")
);

-- CreateTable
CREATE TABLE "chat_messages" (
    "message_id" SERIAL NOT NULL,
    "team_id" INTEGER,
    "user_id" INTEGER,
    "message_text" TEXT,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "chat_messages_pkey" PRIMARY KEY ("message_id")
);

-- CreateTable
CREATE TABLE "collaboration_request_reviews" (
    "review_id" SERIAL NOT NULL,
    "request_id" INTEGER,
    "reviewer_id" INTEGER,
    "collaborator_id" INTEGER,
    "review_status" VARCHAR(20),
    "review_comments" TEXT,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "collaboration_request_reviews_pkey" PRIMARY KEY ("review_id")
);

-- CreateTable
CREATE TABLE "collaboration_requests" (
    "request_id" SERIAL NOT NULL,
    "idea_id" INTEGER,
    "user_id" INTEGER,
    "request_text" TEXT,
    "domain_expertise_required" TEXT,
    "status" VARCHAR(20),
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "collaboration_requests_pkey" PRIMARY KEY ("request_id")
);

-- CreateTable
CREATE TABLE "comments" (
    "comment_id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "user_id" INTEGER,
    "comment_text" TEXT,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "votes" INTEGER DEFAULT 0,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id")
);

-- CreateTable
CREATE TABLE "features" (
    "feature_id" SERIAL NOT NULL,
    "feature_name" VARCHAR(100) NOT NULL,
    "feature_details" TEXT,
    "project_id" INTEGER,

    CONSTRAINT "features_pkey" PRIMARY KEY ("feature_id")
);

-- CreateTable
CREATE TABLE "ideas" (
    "idea_id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "idea_text" TEXT,
    "image_link" TEXT,
    "video_link" TEXT,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ideas_pkey" PRIMARY KEY ("idea_id")
);

-- CreateTable
CREATE TABLE "impressions" (
    "impression_id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "target_id" INTEGER,
    "target_type" VARCHAR(10),
    "impression_type" VARCHAR(20),
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "impressions_pkey" PRIMARY KEY ("impression_id")
);

-- CreateTable
CREATE TABLE "institutions" (
    "institution_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "address" TEXT,

    CONSTRAINT "institutions_pkey" PRIMARY KEY ("institution_id")
);

-- CreateTable
CREATE TABLE "interests" (
    "interest_id" SERIAL NOT NULL,
    "interest_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "interests_pkey" PRIMARY KEY ("interest_id")
);

-- CreateTable
CREATE TABLE "issue_tags" (
    "issue_tag_id" SERIAL NOT NULL,
    "issue_id" INTEGER,
    "tag_id" INTEGER,

    CONSTRAINT "issue_tags_pkey" PRIMARY KEY ("issue_tag_id")
);

-- CreateTable
CREATE TABLE "issues" (
    "issue_id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "status" VARCHAR(20),
    "votes" INTEGER DEFAULT 0,

    CONSTRAINT "issues_pkey" PRIMARY KEY ("issue_id")
);

-- CreateTable
CREATE TABLE "languages" (
    "language_id" SERIAL NOT NULL,
    "language_name" VARCHAR(50) NOT NULL,

    CONSTRAINT "languages_pkey" PRIMARY KEY ("language_id")
);

-- CreateTable
CREATE TABLE "mentors" (
    "mentor_id" SERIAL NOT NULL,
    "mentor_name" VARCHAR(255) NOT NULL,
    "mentor_details" TEXT,

    CONSTRAINT "mentors_pkey" PRIMARY KEY ("mentor_id")
);

-- CreateTable
CREATE TABLE "project_categories" (
    "project_category_id" SERIAL NOT NULL,
    "project_id" INTEGER,
    "language_id" INTEGER,
    "software_id" INTEGER,

    CONSTRAINT "project_categories_pkey" PRIMARY KEY ("project_category_id")
);

-- CreateTable
CREATE TABLE "projects" (
    "project_id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "project_name" VARCHAR(255),
    "duration" VARCHAR(50),
    "mentor_details" INTEGER,
    "reference_text" TEXT,
    "demo_link" TEXT,

    CONSTRAINT "projects_pkey" PRIMARY KEY ("project_id")
);

-- CreateTable
CREATE TABLE "roles" (
    "role_id" SERIAL NOT NULL,
    "label" VARCHAR(50) NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("role_id")
);

-- CreateTable
CREATE TABLE "room_chat_messages" (
    "room_message_id" SERIAL NOT NULL,
    "room_id" INTEGER,
    "user_id" INTEGER,
    "message_text" TEXT,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "room_chat_messages_pkey" PRIMARY KEY ("room_message_id")
);

-- CreateTable
CREATE TABLE "room_member_roles" (
    "room_member_role_id" SERIAL NOT NULL,
    "room_id" INTEGER,
    "user_id" INTEGER,
    "role_name" VARCHAR(50),

    CONSTRAINT "room_member_roles_pkey" PRIMARY KEY ("room_member_role_id")
);

-- CreateTable
CREATE TABLE "room_task_list" (
    "room_task_id" SERIAL NOT NULL,
    "room_id" INTEGER,
    "task_title" VARCHAR(255) NOT NULL,
    "task_description" TEXT,
    "due_date" DATE,
    "status" VARCHAR(20),
    "assigned_to_user_id" INTEGER,

    CONSTRAINT "room_task_list_pkey" PRIMARY KEY ("room_task_id")
);

-- CreateTable
CREATE TABLE "rooms" (
    "room_id" SERIAL NOT NULL,
    "room_name" VARCHAR(255) NOT NULL,
    "objective" TEXT,
    "profile_pic_link" TEXT,

    CONSTRAINT "rooms_pkey" PRIMARY KEY ("room_id")
);

-- CreateTable
CREATE TABLE "skills" (
    "skill_id" SERIAL NOT NULL,
    "skill_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("skill_id")
);

-- CreateTable
CREATE TABLE "software" (
    "software_id" SERIAL NOT NULL,
    "software_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "software_pkey" PRIMARY KEY ("software_id")
);

-- CreateTable
CREATE TABLE "steps" (
    "step_id" SERIAL NOT NULL,
    "input" TEXT,
    "process" TEXT,
    "output" TEXT,
    "useful_link" TEXT[],
    "features_id" INTEGER,

    CONSTRAINT "steps_pkey" PRIMARY KEY ("step_id")
);

-- CreateTable
CREATE TABLE "tags" (
    "tag_id" SERIAL NOT NULL,
    "tag_name" VARCHAR(50) NOT NULL,

    CONSTRAINT "tags_pkey" PRIMARY KEY ("tag_id")
);

-- CreateTable
CREATE TABLE "team_member_roles" (
    "member_role_id" SERIAL NOT NULL,
    "team_id" INTEGER,
    "user_id" INTEGER,
    "role_name" VARCHAR(50),

    CONSTRAINT "team_member_roles_pkey" PRIMARY KEY ("member_role_id")
);

-- CreateTable
CREATE TABLE "teams" (
    "team_id" SERIAL NOT NULL,
    "team_name" VARCHAR(255) NOT NULL,
    "team_author_id" INTEGER,
    "objective" TEXT,
    "profile_pic_link" TEXT,

    CONSTRAINT "teams_pkey" PRIMARY KEY ("team_id")
);

-- CreateTable
CREATE TABLE "user_interests" (
    "user_id" INTEGER NOT NULL,
    "interest_id" INTEGER NOT NULL,

    CONSTRAINT "user_interests_pkey" PRIMARY KEY ("user_id","interest_id")
);

-- CreateTable
CREATE TABLE "user_skills" (
    "user_id" INTEGER NOT NULL,
    "skill_id" INTEGER NOT NULL,

    CONSTRAINT "user_skills_pkey" PRIMARY KEY ("user_id","skill_id")
);

-- CreateTable
CREATE TABLE "users" (
    "user_id" SERIAL NOT NULL,
    "full_name" VARCHAR(255) NOT NULL,
    "role_id" INTEGER,
    "email" VARCHAR(255) NOT NULL,
    "phone_number" VARCHAR(20),
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "refreshToken" TEXT NOT NULL,
    "date_of_birth" DATE,
    "address" TEXT,
    "profile_picture_link" TEXT,
    "institution_id" INTEGER,
    "team_id" INTEGER,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "votes" (
    "vote_id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "parent_id" INTEGER,
    "vote_type" VARCHAR(10),
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "votes_pkey" PRIMARY KEY ("vote_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "interests_interest_name_key" ON "interests"("interest_name");

-- CreateIndex
CREATE UNIQUE INDEX "languages_language_name_key" ON "languages"("language_name");

-- CreateIndex
CREATE UNIQUE INDEX "roles_label_key" ON "roles"("label");

-- CreateIndex
CREATE UNIQUE INDEX "skills_skill_name_key" ON "skills"("skill_name");

-- CreateIndex
CREATE UNIQUE INDEX "software_software_name_key" ON "software"("software_name");

-- CreateIndex
CREATE UNIQUE INDEX "tags_tag_name_key" ON "tags"("tag_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- AddForeignKey
ALTER TABLE "achievements" ADD CONSTRAINT "achievements_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("team_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "answers" ADD CONSTRAINT "answers_issue_id_fkey" FOREIGN KEY ("issue_id") REFERENCES "issues"("issue_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "answers" ADD CONSTRAINT "answers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_messages" ADD CONSTRAINT "chat_messages_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("team_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_messages" ADD CONSTRAINT "chat_messages_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collaboration_request_reviews" ADD CONSTRAINT "collaboration_request_reviews_collaborator_id_fkey" FOREIGN KEY ("collaborator_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collaboration_request_reviews" ADD CONSTRAINT "collaboration_request_reviews_request_id_fkey" FOREIGN KEY ("request_id") REFERENCES "collaboration_requests"("request_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collaboration_request_reviews" ADD CONSTRAINT "collaboration_request_reviews_reviewer_id_fkey" FOREIGN KEY ("reviewer_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collaboration_requests" ADD CONSTRAINT "collaboration_requests_idea_id_fkey" FOREIGN KEY ("idea_id") REFERENCES "ideas"("idea_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "collaboration_requests" ADD CONSTRAINT "collaboration_requests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "features" ADD CONSTRAINT "features_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("project_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ideas" ADD CONSTRAINT "ideas_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "impressions" ADD CONSTRAINT "impressions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "issue_tags" ADD CONSTRAINT "issue_tags_issue_id_fkey" FOREIGN KEY ("issue_id") REFERENCES "issues"("issue_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "issue_tags" ADD CONSTRAINT "issue_tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tags"("tag_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "issues" ADD CONSTRAINT "issues_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "project_categories" ADD CONSTRAINT "project_categories_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("project_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_mentor_details_fkey" FOREIGN KEY ("mentor_details") REFERENCES "mentors"("mentor_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "room_chat_messages" ADD CONSTRAINT "room_chat_messages_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "rooms"("room_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "room_chat_messages" ADD CONSTRAINT "room_chat_messages_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "room_member_roles" ADD CONSTRAINT "room_member_roles_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "rooms"("room_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "room_member_roles" ADD CONSTRAINT "room_member_roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "room_task_list" ADD CONSTRAINT "room_task_list_assigned_to_user_id_fkey" FOREIGN KEY ("assigned_to_user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "room_task_list" ADD CONSTRAINT "room_task_list_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "rooms"("room_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "steps" ADD CONSTRAINT "steps_features_id_fkey" FOREIGN KEY ("features_id") REFERENCES "features"("feature_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "team_member_roles" ADD CONSTRAINT "team_member_roles_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("team_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "team_member_roles" ADD CONSTRAINT "team_member_roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "teams" ADD CONSTRAINT "teams_team_author_id_fkey" FOREIGN KEY ("team_author_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_interests" ADD CONSTRAINT "user_interests_interest_id_fkey" FOREIGN KEY ("interest_id") REFERENCES "interests"("interest_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_interests" ADD CONSTRAINT "user_interests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_skills" ADD CONSTRAINT "user_skills_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "skills"("skill_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_skills" ADD CONSTRAINT "user_skills_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("role_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "votes" ADD CONSTRAINT "votes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

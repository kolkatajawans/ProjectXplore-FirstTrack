/*
  Warnings:

  - The primary key for the `achievements` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `answers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `chat_messages` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `collaboration_request_reviews` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `collaboration_requests` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `comments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `features` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `ideas` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `impressions` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `institutions` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `interests` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `issue_tags` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `issues` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `languages` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `mentors` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `project_categories` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `projects` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `roles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `room_chat_messages` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `room_member_roles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `room_task_list` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `rooms` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `skills` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `software` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `steps` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `tags` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `team_member_roles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `teams` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user_interests` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user_skills` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `votes` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "achievements" DROP CONSTRAINT "achievements_team_id_fkey";

-- DropForeignKey
ALTER TABLE "answers" DROP CONSTRAINT "answers_issue_id_fkey";

-- DropForeignKey
ALTER TABLE "answers" DROP CONSTRAINT "answers_user_id_fkey";

-- DropForeignKey
ALTER TABLE "chat_messages" DROP CONSTRAINT "chat_messages_team_id_fkey";

-- DropForeignKey
ALTER TABLE "chat_messages" DROP CONSTRAINT "chat_messages_user_id_fkey";

-- DropForeignKey
ALTER TABLE "collaboration_request_reviews" DROP CONSTRAINT "collaboration_request_reviews_collaborator_id_fkey";

-- DropForeignKey
ALTER TABLE "collaboration_request_reviews" DROP CONSTRAINT "collaboration_request_reviews_request_id_fkey";

-- DropForeignKey
ALTER TABLE "collaboration_request_reviews" DROP CONSTRAINT "collaboration_request_reviews_reviewer_id_fkey";

-- DropForeignKey
ALTER TABLE "collaboration_requests" DROP CONSTRAINT "collaboration_requests_idea_id_fkey";

-- DropForeignKey
ALTER TABLE "collaboration_requests" DROP CONSTRAINT "collaboration_requests_user_id_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_user_id_fkey";

-- DropForeignKey
ALTER TABLE "features" DROP CONSTRAINT "features_project_id_fkey";

-- DropForeignKey
ALTER TABLE "ideas" DROP CONSTRAINT "ideas_user_id_fkey";

-- DropForeignKey
ALTER TABLE "impressions" DROP CONSTRAINT "impressions_user_id_fkey";

-- DropForeignKey
ALTER TABLE "issue_tags" DROP CONSTRAINT "issue_tags_issue_id_fkey";

-- DropForeignKey
ALTER TABLE "issue_tags" DROP CONSTRAINT "issue_tags_tag_id_fkey";

-- DropForeignKey
ALTER TABLE "issues" DROP CONSTRAINT "issues_user_id_fkey";

-- DropForeignKey
ALTER TABLE "project_categories" DROP CONSTRAINT "project_categories_project_id_fkey";

-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_mentor_details_fkey";

-- DropForeignKey
ALTER TABLE "room_chat_messages" DROP CONSTRAINT "room_chat_messages_room_id_fkey";

-- DropForeignKey
ALTER TABLE "room_chat_messages" DROP CONSTRAINT "room_chat_messages_user_id_fkey";

-- DropForeignKey
ALTER TABLE "room_member_roles" DROP CONSTRAINT "room_member_roles_room_id_fkey";

-- DropForeignKey
ALTER TABLE "room_member_roles" DROP CONSTRAINT "room_member_roles_user_id_fkey";

-- DropForeignKey
ALTER TABLE "room_task_list" DROP CONSTRAINT "room_task_list_assigned_to_user_id_fkey";

-- DropForeignKey
ALTER TABLE "room_task_list" DROP CONSTRAINT "room_task_list_room_id_fkey";

-- DropForeignKey
ALTER TABLE "steps" DROP CONSTRAINT "steps_features_id_fkey";

-- DropForeignKey
ALTER TABLE "team_member_roles" DROP CONSTRAINT "team_member_roles_team_id_fkey";

-- DropForeignKey
ALTER TABLE "team_member_roles" DROP CONSTRAINT "team_member_roles_user_id_fkey";

-- DropForeignKey
ALTER TABLE "teams" DROP CONSTRAINT "teams_team_author_id_fkey";

-- DropForeignKey
ALTER TABLE "user_interests" DROP CONSTRAINT "user_interests_interest_id_fkey";

-- DropForeignKey
ALTER TABLE "user_interests" DROP CONSTRAINT "user_interests_user_id_fkey";

-- DropForeignKey
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_skill_id_fkey";

-- DropForeignKey
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_user_id_fkey";

-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_role_id_fkey";

-- DropForeignKey
ALTER TABLE "votes" DROP CONSTRAINT "votes_user_id_fkey";

-- AlterTable
ALTER TABLE "achievements" DROP CONSTRAINT "achievements_pkey",
ALTER COLUMN "achievement_id" DROP DEFAULT,
ALTER COLUMN "achievement_id" SET DATA TYPE TEXT,
ALTER COLUMN "team_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "achievements_pkey" PRIMARY KEY ("achievement_id");
DROP SEQUENCE "achievements_achievement_id_seq";

-- AlterTable
ALTER TABLE "answers" DROP CONSTRAINT "answers_pkey",
ALTER COLUMN "answer_id" DROP DEFAULT,
ALTER COLUMN "answer_id" SET DATA TYPE TEXT,
ALTER COLUMN "issue_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "answers_pkey" PRIMARY KEY ("answer_id");
DROP SEQUENCE "answers_answer_id_seq";

-- AlterTable
ALTER TABLE "chat_messages" DROP CONSTRAINT "chat_messages_pkey",
ALTER COLUMN "message_id" DROP DEFAULT,
ALTER COLUMN "message_id" SET DATA TYPE TEXT,
ALTER COLUMN "team_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "chat_messages_pkey" PRIMARY KEY ("message_id");
DROP SEQUENCE "chat_messages_message_id_seq";

-- AlterTable
ALTER TABLE "collaboration_request_reviews" DROP CONSTRAINT "collaboration_request_reviews_pkey",
ALTER COLUMN "review_id" DROP DEFAULT,
ALTER COLUMN "review_id" SET DATA TYPE TEXT,
ALTER COLUMN "request_id" SET DATA TYPE TEXT,
ALTER COLUMN "reviewer_id" SET DATA TYPE TEXT,
ALTER COLUMN "collaborator_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "collaboration_request_reviews_pkey" PRIMARY KEY ("review_id");
DROP SEQUENCE "collaboration_request_reviews_review_id_seq";

-- AlterTable
ALTER TABLE "collaboration_requests" DROP CONSTRAINT "collaboration_requests_pkey",
ALTER COLUMN "request_id" DROP DEFAULT,
ALTER COLUMN "request_id" SET DATA TYPE TEXT,
ALTER COLUMN "idea_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "collaboration_requests_pkey" PRIMARY KEY ("request_id");
DROP SEQUENCE "collaboration_requests_request_id_seq";

-- AlterTable
ALTER TABLE "comments" DROP CONSTRAINT "comments_pkey",
ALTER COLUMN "comment_id" DROP DEFAULT,
ALTER COLUMN "comment_id" SET DATA TYPE TEXT,
ALTER COLUMN "parent_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id");
DROP SEQUENCE "comments_comment_id_seq";

-- AlterTable
ALTER TABLE "features" DROP CONSTRAINT "features_pkey",
ALTER COLUMN "feature_id" DROP DEFAULT,
ALTER COLUMN "feature_id" SET DATA TYPE TEXT,
ALTER COLUMN "project_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "features_pkey" PRIMARY KEY ("feature_id");
DROP SEQUENCE "features_feature_id_seq";

-- AlterTable
ALTER TABLE "ideas" DROP CONSTRAINT "ideas_pkey",
ALTER COLUMN "idea_id" DROP DEFAULT,
ALTER COLUMN "idea_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "ideas_pkey" PRIMARY KEY ("idea_id");
DROP SEQUENCE "ideas_idea_id_seq";

-- AlterTable
ALTER TABLE "impressions" DROP CONSTRAINT "impressions_pkey",
ALTER COLUMN "impression_id" DROP DEFAULT,
ALTER COLUMN "impression_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "target_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "impressions_pkey" PRIMARY KEY ("impression_id");
DROP SEQUENCE "impressions_impression_id_seq";

-- AlterTable
ALTER TABLE "institutions" DROP CONSTRAINT "institutions_pkey",
ALTER COLUMN "institution_id" DROP DEFAULT,
ALTER COLUMN "institution_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "institutions_pkey" PRIMARY KEY ("institution_id");
DROP SEQUENCE "institutions_institution_id_seq";

-- AlterTable
ALTER TABLE "interests" DROP CONSTRAINT "interests_pkey",
ALTER COLUMN "interest_id" DROP DEFAULT,
ALTER COLUMN "interest_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "interests_pkey" PRIMARY KEY ("interest_id");
DROP SEQUENCE "interests_interest_id_seq";

-- AlterTable
ALTER TABLE "issue_tags" DROP CONSTRAINT "issue_tags_pkey",
ALTER COLUMN "issue_tag_id" DROP DEFAULT,
ALTER COLUMN "issue_tag_id" SET DATA TYPE TEXT,
ALTER COLUMN "issue_id" SET DATA TYPE TEXT,
ALTER COLUMN "tag_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "issue_tags_pkey" PRIMARY KEY ("issue_tag_id");
DROP SEQUENCE "issue_tags_issue_tag_id_seq";

-- AlterTable
ALTER TABLE "issues" DROP CONSTRAINT "issues_pkey",
ALTER COLUMN "issue_id" DROP DEFAULT,
ALTER COLUMN "issue_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "issues_pkey" PRIMARY KEY ("issue_id");
DROP SEQUENCE "issues_issue_id_seq";

-- AlterTable
ALTER TABLE "languages" DROP CONSTRAINT "languages_pkey",
ALTER COLUMN "language_id" DROP DEFAULT,
ALTER COLUMN "language_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "languages_pkey" PRIMARY KEY ("language_id");
DROP SEQUENCE "languages_language_id_seq";

-- AlterTable
ALTER TABLE "mentors" DROP CONSTRAINT "mentors_pkey",
ALTER COLUMN "mentor_id" DROP DEFAULT,
ALTER COLUMN "mentor_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "mentors_pkey" PRIMARY KEY ("mentor_id");
DROP SEQUENCE "mentors_mentor_id_seq";

-- AlterTable
ALTER TABLE "project_categories" DROP CONSTRAINT "project_categories_pkey",
ALTER COLUMN "project_category_id" DROP DEFAULT,
ALTER COLUMN "project_category_id" SET DATA TYPE TEXT,
ALTER COLUMN "project_id" SET DATA TYPE TEXT,
ALTER COLUMN "language_id" SET DATA TYPE TEXT,
ALTER COLUMN "software_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "project_categories_pkey" PRIMARY KEY ("project_category_id");
DROP SEQUENCE "project_categories_project_category_id_seq";

-- AlterTable
ALTER TABLE "projects" DROP CONSTRAINT "projects_pkey",
ALTER COLUMN "project_id" DROP DEFAULT,
ALTER COLUMN "project_id" SET DATA TYPE TEXT,
ALTER COLUMN "mentor_details" SET DATA TYPE TEXT,
ADD CONSTRAINT "projects_pkey" PRIMARY KEY ("project_id");
DROP SEQUENCE "projects_project_id_seq";

-- AlterTable
ALTER TABLE "roles" DROP CONSTRAINT "roles_pkey",
ALTER COLUMN "role_id" DROP DEFAULT,
ALTER COLUMN "role_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("role_id");
DROP SEQUENCE "roles_role_id_seq";

-- AlterTable
ALTER TABLE "room_chat_messages" DROP CONSTRAINT "room_chat_messages_pkey",
ALTER COLUMN "room_message_id" DROP DEFAULT,
ALTER COLUMN "room_message_id" SET DATA TYPE TEXT,
ALTER COLUMN "room_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "room_chat_messages_pkey" PRIMARY KEY ("room_message_id");
DROP SEQUENCE "room_chat_messages_room_message_id_seq";

-- AlterTable
ALTER TABLE "room_member_roles" DROP CONSTRAINT "room_member_roles_pkey",
ALTER COLUMN "room_member_role_id" DROP DEFAULT,
ALTER COLUMN "room_member_role_id" SET DATA TYPE TEXT,
ALTER COLUMN "room_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "room_member_roles_pkey" PRIMARY KEY ("room_member_role_id");
DROP SEQUENCE "room_member_roles_room_member_role_id_seq";

-- AlterTable
ALTER TABLE "room_task_list" DROP CONSTRAINT "room_task_list_pkey",
ALTER COLUMN "room_task_id" DROP DEFAULT,
ALTER COLUMN "room_task_id" SET DATA TYPE TEXT,
ALTER COLUMN "room_id" SET DATA TYPE TEXT,
ALTER COLUMN "assigned_to_user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "room_task_list_pkey" PRIMARY KEY ("room_task_id");
DROP SEQUENCE "room_task_list_room_task_id_seq";

-- AlterTable
ALTER TABLE "rooms" DROP CONSTRAINT "rooms_pkey",
ALTER COLUMN "room_id" DROP DEFAULT,
ALTER COLUMN "room_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "rooms_pkey" PRIMARY KEY ("room_id");
DROP SEQUENCE "rooms_room_id_seq";

-- AlterTable
ALTER TABLE "skills" DROP CONSTRAINT "skills_pkey",
ALTER COLUMN "skill_id" DROP DEFAULT,
ALTER COLUMN "skill_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "skills_pkey" PRIMARY KEY ("skill_id");
DROP SEQUENCE "skills_skill_id_seq";

-- AlterTable
ALTER TABLE "software" DROP CONSTRAINT "software_pkey",
ALTER COLUMN "software_id" DROP DEFAULT,
ALTER COLUMN "software_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "software_pkey" PRIMARY KEY ("software_id");
DROP SEQUENCE "software_software_id_seq";

-- AlterTable
ALTER TABLE "steps" DROP CONSTRAINT "steps_pkey",
ALTER COLUMN "step_id" DROP DEFAULT,
ALTER COLUMN "step_id" SET DATA TYPE TEXT,
ALTER COLUMN "features_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "steps_pkey" PRIMARY KEY ("step_id");
DROP SEQUENCE "steps_step_id_seq";

-- AlterTable
ALTER TABLE "tags" DROP CONSTRAINT "tags_pkey",
ALTER COLUMN "tag_id" DROP DEFAULT,
ALTER COLUMN "tag_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "tags_pkey" PRIMARY KEY ("tag_id");
DROP SEQUENCE "tags_tag_id_seq";

-- AlterTable
ALTER TABLE "team_member_roles" DROP CONSTRAINT "team_member_roles_pkey",
ALTER COLUMN "member_role_id" DROP DEFAULT,
ALTER COLUMN "member_role_id" SET DATA TYPE TEXT,
ALTER COLUMN "team_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "team_member_roles_pkey" PRIMARY KEY ("member_role_id");
DROP SEQUENCE "team_member_roles_member_role_id_seq";

-- AlterTable
ALTER TABLE "teams" DROP CONSTRAINT "teams_pkey",
ALTER COLUMN "team_id" DROP DEFAULT,
ALTER COLUMN "team_id" SET DATA TYPE TEXT,
ALTER COLUMN "team_author_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "teams_pkey" PRIMARY KEY ("team_id");
DROP SEQUENCE "teams_team_id_seq";

-- AlterTable
ALTER TABLE "user_interests" DROP CONSTRAINT "user_interests_pkey",
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "interest_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "user_interests_pkey" PRIMARY KEY ("user_id", "interest_id");

-- AlterTable
ALTER TABLE "user_skills" DROP CONSTRAINT "user_skills_pkey",
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "skill_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "user_skills_pkey" PRIMARY KEY ("user_id", "skill_id");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
ALTER COLUMN "user_id" DROP DEFAULT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "role_id" SET DATA TYPE TEXT,
ALTER COLUMN "institution_id" SET DATA TYPE TEXT,
ALTER COLUMN "team_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("user_id");
DROP SEQUENCE "users_user_id_seq";

-- AlterTable
ALTER TABLE "votes" DROP CONSTRAINT "votes_pkey",
ALTER COLUMN "vote_id" DROP DEFAULT,
ALTER COLUMN "vote_id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ALTER COLUMN "parent_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "votes_pkey" PRIMARY KEY ("vote_id");
DROP SEQUENCE "votes_vote_id_seq";

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

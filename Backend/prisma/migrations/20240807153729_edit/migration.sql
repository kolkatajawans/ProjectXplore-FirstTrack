-- AlterTable
ALTER TABLE "Request" ADD COLUMN     "roomId" INTEGER;

-- AddForeignKey
ALTER TABLE "Request" ADD CONSTRAINT "Request_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE SET NULL ON UPDATE CASCADE;

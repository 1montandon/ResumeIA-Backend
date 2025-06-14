/*
  Warnings:

  - You are about to drop the column `resumeFile` on the `Analyses` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Analyses" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "jobDescription" TEXT NOT NULL,
    "score" REAL NOT NULL,
    "strengths" TEXT NOT NULL,
    "weaknesses" TEXT NOT NULL,
    "overview" TEXT NOT NULL,
    "resumeUrl" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Analyses_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Analyses" ("createdAt", "id", "jobDescription", "overview", "resumeUrl", "score", "strengths", "userId", "weaknesses") SELECT "createdAt", "id", "jobDescription", "overview", "resumeUrl", "score", "strengths", "userId", "weaknesses" FROM "Analyses";
DROP TABLE "Analyses";
ALTER TABLE "new_Analyses" RENAME TO "Analyses";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

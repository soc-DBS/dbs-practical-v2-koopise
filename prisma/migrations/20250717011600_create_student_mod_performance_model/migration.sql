/*
  Warnings:

  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "student" DROP CONSTRAINT "student_pkey",
ADD CONSTRAINT "student_pkey" PRIMARY KEY ("adm_no");

-- CreateTable
CREATE TABLE "student_mod_performance" (
    "adm_no_character" CHAR(4) NOT NULL,
    "mod_registered" VARCHAR(10) NOT NULL,
    "mark" INTEGER NOT NULL,
    "grade" CHAR(1) NOT NULL,

    CONSTRAINT "student_mod_performance_pkey" PRIMARY KEY ("adm_no_character","mod_registered")
);

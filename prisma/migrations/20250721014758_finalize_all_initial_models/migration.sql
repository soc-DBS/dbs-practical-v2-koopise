/*
  Warnings:

  - The primary key for the `staff_dependent` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `dependent_name` on the `staff_dependent` table. The data in that column could be lost. The data in that column will be cast from `VarChar(100)` to `VarChar(30)`.
  - You are about to drop the column `address_character_varying` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `gender_character` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `nationality_character_varying` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `student_name` on the `student` table. All the data in the column will be lost.
  - You are about to drop the `student_mod_performance` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `address` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gender` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nationality` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stud_name` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "course" DROP CONSTRAINT "course_offered_by_fkey";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_nationality_fk";

-- DropForeignKey
ALTER TABLE "student_mod_performance" DROP CONSTRAINT "student_mod_performance_adm_no_fk";

-- DropForeignKey
ALTER TABLE "student_mod_performance" DROP CONSTRAINT "student_mod_performance_mod_code_fk";

-- AlterTable
ALTER TABLE "staff_dependent" DROP CONSTRAINT "staff_dependent_pkey",
ALTER COLUMN "dependent_name" SET DATA TYPE VARCHAR(30),
ADD CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff_no", "dependent_name");

-- AlterTable
ALTER TABLE "student" DROP COLUMN "address_character_varying",
DROP COLUMN "gender_character",
DROP COLUMN "nationality_character_varying",
DROP COLUMN "student_name",
ADD COLUMN     "address" VARCHAR(100) NOT NULL,
ADD COLUMN     "gender" CHAR(1) NOT NULL,
ADD COLUMN     "nationality" VARCHAR(30) NOT NULL,
ADD COLUMN     "stud_name" VARCHAR(30) NOT NULL,
ALTER COLUMN "mobile_phone" DROP NOT NULL,
ALTER COLUMN "home_phone" DROP NOT NULL;

-- DropTable
DROP TABLE "student_mod_performance";

-- CreateTable
CREATE TABLE "stud_mod_performance" (
    "adm_no" CHAR(4) NOT NULL,
    "mod_registered" VARCHAR(10) NOT NULL,
    "mark" INTEGER,
    "grade" CHAR(2),

    CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("adm_no","mod_registered")
);

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_offered_by_fk" FOREIGN KEY ("offered_by") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fk" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE NO ACTION ON UPDATE NO ACTION;

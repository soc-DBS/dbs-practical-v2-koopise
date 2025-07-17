-- CreateTable
CREATE TABLE "student" (
    "adm_no" CHAR(4) NOT NULL,
    "student_name" VARCHAR(30) NOT NULL,
    "gender_character" CHAR(1) NOT NULL,
    "address_character_varying" VARCHAR(100) NOT NULL,
    "mobile_phone" CHAR(8) NOT NULL,
    "home_phone" CHAR(8) NOT NULL,
    "dob" DATE NOT NULL,
    "nationality_character_varying" VARCHAR(30) NOT NULL,
    "crse_code" VARCHAR(5) NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("adm_no","crse_code")
);

-- CreateTable
CREATE TABLE "module" (
    "mod_code" VARCHAR(10) NOT NULL,
    "mod_name" VARCHAR(100) NOT NULL,
    "credit_unit" INTEGER NOT NULL,
    "mod_coord" CHAR(4),

    CONSTRAINT "module_pkey" PRIMARY KEY ("mod_code")
);

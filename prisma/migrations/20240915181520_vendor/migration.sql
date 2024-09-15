/*
  Warnings:

  - The primary key for the `admin` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `admin` table. All the data in the column will be lost.
  - The required column `adminId` was added to the `admin` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "admin" DROP CONSTRAINT "admin_pkey",
DROP COLUMN "id",
ADD COLUMN     "adminId" TEXT NOT NULL,
ADD CONSTRAINT "admin_pkey" PRIMARY KEY ("adminId");

-- CreateTable
CREATE TABLE "vendor" (
    "vendorId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profile" TEXT NOT NULL,
    "isApproved" TEXT NOT NULL DEFAULT 'no',
    "mobileNo" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "vendor_pkey" PRIMARY KEY ("vendorId")
);

-- CreateTable
CREATE TABLE "vendorBankDetails" (
    "id" TEXT NOT NULL,
    "bankName" TEXT NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "accountType" TEXT NOT NULL,
    "accountHolder" TEXT NOT NULL,
    "VendorId" TEXT NOT NULL,

    CONSTRAINT "vendorBankDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vendorSocialMeadia" (
    "id" TEXT NOT NULL,
    "facebook" TEXT NOT NULL,
    "insta" TEXT NOT NULL,
    "linkedIn" TEXT NOT NULL,
    "vendorId" TEXT NOT NULL,

    CONSTRAINT "vendorSocialMeadia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vendorAddress" (
    "id" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "vendorId" TEXT NOT NULL,

    CONSTRAINT "vendorAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customer" (
    "customerId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "mobileNo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "customer_pkey" PRIMARY KEY ("customerId")
);

-- CreateIndex
CREATE UNIQUE INDEX "vendor_email_key" ON "vendor"("email");

-- AddForeignKey
ALTER TABLE "vendorBankDetails" ADD CONSTRAINT "vendorBankDetails_VendorId_fkey" FOREIGN KEY ("VendorId") REFERENCES "vendor"("vendorId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vendorSocialMeadia" ADD CONSTRAINT "vendorSocialMeadia_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("vendorId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vendorAddress" ADD CONSTRAINT "vendorAddress_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "vendor"("vendorId") ON DELETE RESTRICT ON UPDATE CASCADE;

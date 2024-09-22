/*
  Warnings:

  - You are about to drop the column `secretKey` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the `vendorAddress` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `vendorBankDetails` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `vendorSocialMeadia` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[mobileNo]` on the table `vendor` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `profilePath` to the `admin` table without a default value. This is not possible if the table is not empty.
  - Added the required column `accountHolder` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `accountNumber` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `accountType` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bankName` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `city` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `facebook` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `insta` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `linkedIn` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `postalCode` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `state` to the `vendor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `street` to the `vendor` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "vendorAddress" DROP CONSTRAINT "vendorAddress_vendorId_fkey";

-- DropForeignKey
ALTER TABLE "vendorBankDetails" DROP CONSTRAINT "vendorBankDetails_VendorId_fkey";

-- DropForeignKey
ALTER TABLE "vendorSocialMeadia" DROP CONSTRAINT "vendorSocialMeadia_vendorId_fkey";

-- AlterTable
ALTER TABLE "admin" DROP COLUMN "secretKey",
ADD COLUMN     "profilePath" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "vendor" ADD COLUMN     "accountHolder" TEXT NOT NULL,
ADD COLUMN     "accountNumber" TEXT NOT NULL,
ADD COLUMN     "accountType" TEXT NOT NULL,
ADD COLUMN     "bankName" TEXT NOT NULL,
ADD COLUMN     "city" TEXT NOT NULL,
ADD COLUMN     "facebook" TEXT NOT NULL,
ADD COLUMN     "insta" TEXT NOT NULL,
ADD COLUMN     "linkedIn" TEXT NOT NULL,
ADD COLUMN     "postalCode" TEXT NOT NULL,
ADD COLUMN     "state" TEXT NOT NULL,
ADD COLUMN     "street" TEXT NOT NULL;

-- DropTable
DROP TABLE "vendorAddress";

-- DropTable
DROP TABLE "vendorBankDetails";

-- DropTable
DROP TABLE "vendorSocialMeadia";

-- CreateIndex
CREATE UNIQUE INDEX "vendor_mobileNo_key" ON "vendor"("mobileNo");

/*
  Warnings:

  - You are about to alter the column `idade` on the `candidatas` table. The data in that column could be lost. The data in that column will be cast from `Int` to `SmallInt`.
  - You are about to alter the column `data_nasc` on the `clientes` table. The data in that column could be lost. The data in that column will be cast from `VarChar(30)` to `DateTime(3)`.

*/
-- AlterTable
ALTER TABLE `candidatas` MODIFY `idade` SMALLINT NOT NULL;

-- AlterTable
ALTER TABLE `clientes` MODIFY `data_nasc` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `votos` ADD COLUMN `justificativa` VARCHAR(200) NULL,
    MODIFY `data` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

ALTER TABLE `manager` CHANGE `phone_no` `phone_no` VARCHAR(15) NULL DEFAULT NULL; 
ALTER TABLE `manager` CHANGE `address` `address` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL, CHANGE `picture` `picture` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;
ALTER TABLE `payment_report` CHANGE `date` `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `payment_report` CHANGE `amount_paid` `amount_paid` DOUBLE NULL DEFAULT 0;
ALTER TABLE `payment_report` CHANGE `shop_no` `shop_id` INT(8) NULL DEFAULT NULL, CHANGE `year` `year` VARCHAR(4) NOT NULL;
ALTER TABLE `plaza` CHANGE `no_of_shop` `no_of_shop` INT(8) NOT NULL, CHANGE `manager_id` `manager_id` INT(8) NOT NULL;
ALTER TABLE `plaza_phases` CHANGE `no_of_shops` `no_of_shops` INT(5) NOT NULL DEFAULT 0;
ALTER TABLE `users` CHANGE `createdAt` `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, CHANGE `updatedAt` `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; 
-- CreateTable
CREATE TABLE `User` (
    `login_id` VARCHAR(191) NOT NULL,
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `registration_date` DATETIME(3) NOT NULL,
    `phone_number` VARCHAR(191) NOT NULL,
    `interest` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `User_login_id_key`(`login_id`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Club` (
    `club_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `member_count` INTEGER NOT NULL,
    `creation_date` DATETIME(3) NOT NULL,

    PRIMARY KEY (`club_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ClubRegistration` (
    `registration_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `club_id` INTEGER NOT NULL,
    `status` ENUM('Waiting', 'Approved', 'Rejected') NOT NULL DEFAULT 'Waiting',
    `application_date` DATETIME(3) NOT NULL,

    PRIMARY KEY (`registration_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ChatRoom` (
    `chatroom_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `room_type` ENUM('Group', 'Personal') NOT NULL,
    `club_id` INTEGER NULL,
    `partner_id` INTEGER NULL,

    PRIMARY KEY (`chatroom_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ChatMessage` (
    `message_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `chatroom_id` INTEGER NOT NULL,
    `content` VARCHAR(191) NOT NULL,
    `sent_time` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`message_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ClubRegistration` ADD CONSTRAINT `ClubRegistration_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ClubRegistration` ADD CONSTRAINT `ClubRegistration_club_id_fkey` FOREIGN KEY (`club_id`) REFERENCES `Club`(`club_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChatRoom` ADD CONSTRAINT `ChatRoom_club_id_fkey` FOREIGN KEY (`club_id`) REFERENCES `Club`(`club_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChatRoom` ADD CONSTRAINT `ChatRoom_partner_id_fkey` FOREIGN KEY (`partner_id`) REFERENCES `User`(`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChatMessage` ADD CONSTRAINT `ChatMessage_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChatMessage` ADD CONSTRAINT `ChatMessage_chatroom_id_fkey` FOREIGN KEY (`chatroom_id`) REFERENCES `ChatRoom`(`chatroom_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

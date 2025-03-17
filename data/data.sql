BEGIN;

DROP TABLE IF EXISTS `user`, `day`, `meal`, `day_meal`, `food_meal`, `food`, `team`, `team_user`, `team_user_message`, `session`, `exercise`, `exercise_session`, `media`, `food_media`, `exercise_media`, `media_user`;

CREATE TABLE `user` (
    `id` INT AUTO_INCREMENT PRIMARY KEY, 
    `username` VARCHAR(55) NOT NULL,
    `password` VARCHAR(55) NOT NULL,
    `firstname` VARCHAR(55) NOT NULL,
    `lastname` VARCHAR(55) NOT NULL,
    `email` VARCHAR(55) NOT NULL,
    `height` INT,
    `weight` INT,
    `age` INT NOT NULL,
    `role` VARCHAR(15) NOT NULL,
    `public` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `team` (
    `id` INT AUTO_INCREMENT PRIMARY KEY, 
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `team_user` (
    `user_id` INT NOT NULL,
    `team_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ,
    FOREIGN KEY (`team_id`) REFERENCES `team`(`id`) 
);

CREATE TABLE `team_user_message` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `message` TEXT NOT NULL,
    `user_id` INT NOT NULL ,
    `team_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`team_id`) REFERENCES `team`(`id`)
);

CREATE TABLE `day` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `date` DATE NOT NULL,
    `user_id` INT NOT NULL ,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE
);

CREATE TABLE `meal` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(55) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `day_meal` (
    `day_id` INT NOT NULL ,
    `meal_id` INT NOT NULL ,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`day_id`) REFERENCES `day`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`meal_id`) REFERENCES `meal`(`id`) ON DELETE CASCADE
);

CREATE TABLE `food` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(55) NOT NULL,
    `calories` INT NOT NULL,
    `protein` INT NOT NULL,
    `carbs` INT NOT NULL,
    `fat` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `food_meal` (
    `meal_id` INT NOT NULL,
    `food_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`meal_id`) REFERENCES `meal`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`food_id`) REFERENCES `food`(`id`) ON DELETE CASCADE
);

CREATE TABLE `session` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(55) NOT NULL,
    `day_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`day_id`) REFERENCES `day`(`id`) ON DELETE CASCADE
);

CREATE TABLE `exercise` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(55) NOT NULL,
    `calories` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `exercise_session` (
    `session_id` INT NOT NULL,
    `exercise_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`session_id`) REFERENCES `session`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`exercise_id`) REFERENCES `exercise`(`id`) ON DELETE CASCADE
);

CREATE TABLE `media` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(55) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `food_media` (
    `food_id` INT NOT NULL,
    `media_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`food_id`) REFERENCES `food`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`media_id`) REFERENCES `media`(`id`) ON DELETE CASCADE
);

CREATE TABLE `exercise_media` (
    `exercise_id` INT NOT NULL,
    `media_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`exercise_id`) REFERENCES `exercise`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`media_id`) REFERENCES `media`(`id`) ON DELETE CASCADE
);

CREATE TABLE `media_user` (
    `user_id` INT NOT NULL,
    `media_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`media_id`) REFERENCES `media`(`id`) ON DELETE CASCADE
);

COMMIT;

BEGIN; 

DROP TABLE IF EXISTS "user", "day", "day_meal", "meal", "food_meal", "food" , "team", "team_user", "team_user_message", "session", "exercise", "exercise_session", "media", "food_media", "exercise_media", "media_user";

CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(55) NOT NULL,
    "password" VARCHAR(55) NOT NULL,
    "firstname" VARCHAR(55) NOT NULL,
    "lastname" VARCHAR(55) NOT NULL,
    "email" VARCHAR(55) NOT NULL,
    "height" INT,
    "weight" INT,
    "age" INT NOT NULL,
    "role" VARCHAR(15) NOT NULL,
    "public" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "team" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "team_user" (
    "user_id" INT NOT NULL references "user"("id"),
    "team_id" INT NOT NULL references "team"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "team_user_message" (
    "id" SERIAL PRIMARY KEY,
    "message" TEXT NOT NULL,
    "user_id" INT NOT NULL references "user"("id"),
    "team_id" INT NOT NULL references "team"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE "day" (
    "id" SERIAL PRIMARY KEY,
    "date" DATE NOT NULL,
    "user_id" INT NOT NULL references "user"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "day_meal" (
    "day_id" INT NOT NULL references "day"("id"),
    "meal_id" INT NOT NULL references "meal"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "meal" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(55) NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "food_meal" (
    "meal_id" INT NOT NULL references "meal"("id"),
    "food_id" INT NOT NULL references "food"("id"),
    "quantity" INT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "food" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(55) NOT NULL,
    "calories" INT NOT NULL,
    "protein" INT NOT NULL,
    "carbs" INT NOT NULL,
    "fat" INT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "session"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(55) NOT NULL,
    "day_id" INT NOT NULL references "day"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "exercise"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(55) NOT NULL,
    "calories" INT NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "exercise_session"(
    "session_id" INT NOT NULL references "session"("id"),
    "exercise_id" INT NOT NULL references "exercise"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "media"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(55) NOT NULL,
    "url" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "food_media"(
    "food_id" INT NOT NULL references "food"("id"),
    "media_id" INT NOT NULL references "media"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "exercise_media"(
    "exercise_id" INT NOT NULL references "exercise"("id"),
    "media_id" INT NOT NULL references "media"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "media_user"(
    "user_id" INT NOT NULL references "user"("id"),
    "media_id" INT NOT NULL references "media"("id"),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMIT;
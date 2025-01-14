-- Active: 1719840209096@@localhost@5432@cafe_d
BEGIN;

DROP TABLE IF EXISTS "user";

CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL
);



INSERT INTO "user" ("firstname","lastname", "email","password") VALUES
('momo', 'popon', 'momo@gmail.com', '57E36D18FED48EDACF4982BBD493DA71'),
('widi', 'mama', 'widi@gmail.com', '379547E062FE0E6BF2F8013FA65D68C4'),
('lotro', 'game', 'game_lotro@gmail.com', '4CD61ABCA285E143D038B7BE874549BD');


COMMIT;
BEGIN;
CREATE TABLE "brackets_contestant" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fifa_team_id" integer NOT NULL REFERENCES "brackets_fifateam" ("id"), "player_1_id" integer NOT NULL REFERENCES "auth_user" ("id"), "player_2_id" integer NULL REFERENCES "auth_user" ("id"), "player_3_id" integer NULL REFERENCES "auth_user" ("id"), "player_4_id" integer NULL REFERENCES "auth_user" ("id"));
CREATE TABLE "brackets_fixture" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(180) NOT NULL UNIQUE, "description" varchar(180) NULL, "date_created" datetime NOT NULL, "date_updated" datetime NOT NULL, "fixture_type_id" integer NOT NULL REFERENCES "brackets_fixturetype" ("id"));
CREATE TABLE "brackets_contestants__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "player_1_id" integer NOT NULL REFERENCES "auth_user" ("id"), "player_2_id" integer NULL REFERENCES "auth_user" ("id"), "player_3_id" integer NULL REFERENCES "auth_user" ("id"), "player_4_id" integer NULL REFERENCES "auth_user" ("id"));
INSERT INTO "brackets_contestants__new" ("player_3_id", "player_2_id", "player_4_id", "player_1_id", "id") SELECT "player_3_id", "player_2_id", "player_4_id", "player_1_id", "id" FROM "brackets_contestants";
DROP TABLE "brackets_contestants";
ALTER TABLE "brackets_contestants__new" RENAME TO "brackets_contestants";
CREATE INDEX "brackets_contestant_2079ec3b" ON "brackets_contestant" ("fifa_team_id");
CREATE INDEX "brackets_contestant_f0de2a95" ON "brackets_contestant" ("player_1_id");
CREATE INDEX "brackets_contestant_e55e16c9" ON "brackets_contestant" ("player_2_id");
CREATE INDEX "brackets_contestant_46b1be6c" ON "brackets_contestant" ("player_3_id");
CREATE INDEX "brackets_contestant_d18e62fd" ON "brackets_contestant" ("player_4_id");
CREATE INDEX "brackets_fixture_ba84f98a" ON "brackets_fixture" ("fixture_type_id");
CREATE INDEX "brackets_contestants_f0de2a95" ON "brackets_contestants" ("player_1_id");
CREATE INDEX "brackets_contestants_e55e16c9" ON "brackets_contestants" ("player_2_id");
CREATE INDEX "brackets_contestants_46b1be6c" ON "brackets_contestants" ("player_3_id");
CREATE INDEX "brackets_contestants_d18e62fd" ON "brackets_contestants" ("player_4_id");
CREATE TABLE "brackets_contestants__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "player_2_id" integer NULL REFERENCES "auth_user" ("id"), "player_3_id" integer NULL REFERENCES "auth_user" ("id"), "player_4_id" integer NULL REFERENCES "auth_user" ("id"));
INSERT INTO "brackets_contestants__new" ("player_3_id", "player_4_id", "player_2_id", "id") SELECT "player_3_id", "player_4_id", "player_2_id", "id" FROM "brackets_contestants";
DROP TABLE "brackets_contestants";
ALTER TABLE "brackets_contestants__new" RENAME TO "brackets_contestants";
CREATE INDEX "brackets_contestants_e55e16c9" ON "brackets_contestants" ("player_2_id");
CREATE INDEX "brackets_contestants_46b1be6c" ON "brackets_contestants" ("player_3_id");
CREATE INDEX "brackets_contestants_d18e62fd" ON "brackets_contestants" ("player_4_id");
CREATE TABLE "brackets_contestants__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "player_3_id" integer NULL REFERENCES "auth_user" ("id"), "player_4_id" integer NULL REFERENCES "auth_user" ("id"));
INSERT INTO "brackets_contestants__new" ("player_3_id", "player_4_id", "id") SELECT "player_3_id", "player_4_id", "id" FROM "brackets_contestants";
DROP TABLE "brackets_contestants";
ALTER TABLE "brackets_contestants__new" RENAME TO "brackets_contestants";
CREATE INDEX "brackets_contestants_46b1be6c" ON "brackets_contestants" ("player_3_id");
CREATE INDEX "brackets_contestants_d18e62fd" ON "brackets_contestants" ("player_4_id");
CREATE TABLE "brackets_contestants__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "player_4_id" integer NULL REFERENCES "auth_user" ("id"));
INSERT INTO "brackets_contestants__new" ("player_4_id", "id") SELECT "player_4_id", "id" FROM "brackets_contestants";
DROP TABLE "brackets_contestants";
ALTER TABLE "brackets_contestants__new" RENAME TO "brackets_contestants";
CREATE INDEX "brackets_contestants_d18e62fd" ON "brackets_contestants" ("player_4_id");
CREATE TABLE "brackets_contestants__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT);
INSERT INTO "brackets_contestants__new" ("id") SELECT "id" FROM "brackets_contestants";
DROP TABLE "brackets_contestants";
ALTER TABLE "brackets_contestants__new" RENAME TO "brackets_contestants";
CREATE TABLE "brackets_fixtures__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(180) NOT NULL UNIQUE, "description" varchar(180) NULL, "date_created" datetime NOT NULL, "date_updated" datetime NOT NULL);
INSERT INTO "brackets_fixtures__new" ("date_updated", "date_created", "name", "description", "id") SELECT "date_updated", "date_created", "name", "description", "id" FROM "brackets_fixtures";
DROP TABLE "brackets_fixtures";
ALTER TABLE "brackets_fixtures__new" RENAME TO "brackets_fixtures";
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "Match Complete" bool NOT NULL, "Match Date" date NULL, "Team 1 Score" integer NULL, "Team 2 Score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_2_id" integer NULL REFERENCES "brackets_contestants" ("id"), "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"));
INSERT INTO "brackets_match__new" ("contestant_1_at", "Team 2 Score", "contestant_2_id", "Match Date", "Match Complete", "contestant_1_id", "Team 1 Score", "id") SELECT "contestant_1_at", "Team 2 Score", "contestant_2_id", "Match Date", "Match Complete", "contestant_1_id", "Team 1 Score", "id" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "Match Complete" bool NOT NULL, "Match Date" date NULL, "Team 1 Score" integer NULL, "Team 2 Score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"));
INSERT INTO "brackets_match__new" ("contestant_1_at", "Team 2 Score", "contestant_2_id", "Match Date", "Match Complete", "contestant_1_id", "Team 1 Score", "id") SELECT "contestant_1_at", "Team 2 Score", "contestant_2_id", "Match Date", "Match Complete", "contestant_1_id", "Team 1 Score", "id" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
DROP TABLE "brackets_contestants";
DROP TABLE "brackets_fixtures";
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "Match Complete" bool NOT NULL, "Match Date" date NULL, "Team 1 Score" integer NULL, "Team 2 Score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"));
INSERT INTO "brackets_match__new" ("contestant_1_at", "Team 2 Score", "fixture_id", "contestant_2_id", "Match Date", "Match Complete", "contestant_1_id", "Team 1 Score", "id") SELECT "contestant_1_at", "Team 2 Score", 1, "contestant_2_id", "Match Date", "Match Complete", "contestant_1_id", "Team 1 Score", "id" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");

COMMIT;

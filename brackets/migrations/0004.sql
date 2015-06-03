BEGIN;
CREATE TABLE "brackets_contestant__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "description" varchar(120) NOT NULL, "fifa_team_id" integer NOT NULL REFERENCES "brackets_fifateam" ("id"), "player_1_id" integer NOT NULL REFERENCES "auth_user" ("id"), "player_2_id" integer NULL REFERENCES "auth_user" ("id"), "player_3_id" integer NULL REFERENCES "auth_user" ("id"), "player_4_id" integer NULL REFERENCES "auth_user" ("id"));
INSERT INTO "brackets_contestant__new" ("description", "id", "player_3_id", "player_4_id", "player_1_id", "player_2_id", "fifa_team_id") SELECT 'matt vs. the world', "id", "player_3_id", "player_4_id", "player_1_id", "player_2_id", "fifa_team_id" FROM "brackets_contestant";
DROP TABLE "brackets_contestant";
ALTER TABLE "brackets_contestant__new" RENAME TO "brackets_contestant";
CREATE INDEX "brackets_contestant_2079ec3b" ON "brackets_contestant" ("fifa_team_id");
CREATE INDEX "brackets_contestant_f0de2a95" ON "brackets_contestant" ("player_1_id");
CREATE INDEX "brackets_contestant_e55e16c9" ON "brackets_contestant" ("player_2_id");
CREATE INDEX "brackets_contestant_46b1be6c" ON "brackets_contestant" ("player_3_id");
CREATE INDEX "brackets_contestant_d18e62fd" ON "brackets_contestant" ("player_4_id");
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "Match Complete" bool NOT NULL, "Match Date" date NULL, "Team 1 Score" integer NULL, "Team 2 Score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"), "contestant_2_at" varchar(1) NOT NULL);
INSERT INTO "brackets_match__new" ("fixture_id", "contestant_2_at", "contestant_1_id", "id", "contestant_1_at", "Team 2 Score", "Match Complete", "Team 1 Score", "Match Date", "contestant_2_id") SELECT "fixture_id", 'A', "contestant_1_id", "id", "contestant_1_at", "Team 2 Score", "Match Complete", "Team 1 Score", "Match Date", "contestant_2_id" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");

COMMIT;

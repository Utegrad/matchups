BEGIN;
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "match_complete" bool NOT NULL, "Match Date" date NULL, "Team 1 Score" integer NULL, "Team 2 Score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"), "contestant_2_at" varchar(1) NOT NULL);
INSERT INTO "brackets_match__new" ("fixture_id", "Match Date", "contestant_2_at", "contestant_1_id", "contestant_2_id", "id", "contestant_1_at", "Team 2 Score", "match_complete", "Team 1 Score") SELECT "fixture_id", "Match Date", "contestant_2_at", "contestant_1_id", "contestant_2_id", "id", "contestant_1_at", "Team 2 Score", "Match Complete", "Team 1 Score" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "match_complete" bool NOT NULL, "Team 1 Score" integer NULL, "Team 2 Score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"), "contestant_2_at" varchar(1) NOT NULL, "match_date" date NULL);
INSERT INTO "brackets_match__new" ("fixture_id", "contestant_2_at", "contestant_1_id", "match_date", "id", "contestant_1_at", "Team 1 Score", "Team 2 Score", "match_complete", "contestant_2_id") SELECT "fixture_id", "contestant_2_at", "contestant_1_id", "Match Date", "id", "contestant_1_at", "Team 1 Score", "Team 2 Score", "match_complete", "contestant_2_id" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "match_complete" bool NOT NULL, "match_date" date NULL, "Team 2 Score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"), "contestant_2_at" varchar(1) NOT NULL, "team_1_score" integer NULL);
INSERT INTO "brackets_match__new" ("fixture_id", "contestant_1_id", "contestant_2_at", "contestant_2_id", "id", "contestant_1_at", "match_date", "team_1_score", "Team 2 Score", "match_complete") SELECT "fixture_id", "contestant_1_id", "contestant_2_at", "contestant_2_id", "id", "contestant_1_at", "match_date", "Team 1 Score", "Team 2 Score", "match_complete" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");
CREATE TABLE "brackets_match__new" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "match_complete" bool NOT NULL, "match_date" date NULL, "team_1_score" integer NULL, "contestant_1_at" varchar(1) NOT NULL, "contestant_1_id" integer NULL REFERENCES "brackets_contestant" ("id"), "contestant_2_id" integer NULL REFERENCES "brackets_contestant" ("id"), "fixture_id" integer NOT NULL REFERENCES "brackets_fixture" ("id"), "contestant_2_at" varchar(1) NOT NULL, "team_2_score" integer NULL);
INSERT INTO "brackets_match__new" ("fixture_id", "contestant_1_id", "contestant_2_id", "team_1_score", "contestant_1_at", "team_2_score", "match_date", "id", "match_complete", "contestant_2_at") SELECT "fixture_id", "contestant_1_id", "contestant_2_id", "team_1_score", "contestant_1_at", "Team 2 Score", "match_date", "id", "match_complete", "contestant_2_at" FROM "brackets_match";
DROP TABLE "brackets_match";
ALTER TABLE "brackets_match__new" RENAME TO "brackets_match";
CREATE INDEX "brackets_match_a8530540" ON "brackets_match" ("contestant_1_id");
CREATE INDEX "brackets_match_5dea5cbb" ON "brackets_match" ("contestant_2_id");
CREATE INDEX "brackets_match_7774e9c4" ON "brackets_match" ("fixture_id");

COMMIT;

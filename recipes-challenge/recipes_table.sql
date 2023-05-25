
-- Table Definition
CREATE TABLE "public"."recipes" (
    "id" SERIAL,
    "name" text,
    "avg_cooking_time" int,
    "rating" int,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."recipes" ("id","name", "avg_cooking_time", "rating") VALUES
(1, 'Lasagne', '90', '4'),
(2, 'Chicken casserole', '120', '3'),
(3, 'pad thai', '30', '5')

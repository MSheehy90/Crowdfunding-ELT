-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" int   NOT NULL,
    "description" int   NOT NULL,
    "goal" int   NOT NULL,
    "pledged" int   NOT NULL,
    "outcome" int   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" int   NOT NULL,
    "currency" int   NOT NULL,
    "launch_date" int   NOT NULL,
    "end_date" int   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "contacts" (
    "conact_id" int   NOT NULL,
    "first_name" int   NOT NULL,
    "last_name" int   NOT NULL,
    "email" int   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "conact_id"
     )
);

CREATE TABLE "category" (
    "category_id" varchar(10)   NOT NULL,
    "category_name" int   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" int   NOT NULL,
    "subcatgory_name" int   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "backers" (
    "backer_id" varchar   NOT NULL,
    "cf_id" int   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar   NOT NULL,
    "email" varchar(100)   NOT NULL,
    CONSTRAINT "pk_backers" PRIMARY KEY (
        "first_name","last_name","email"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_cf_id" FOREIGN KEY("cf_id")
REFERENCES "backers" ("cf_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("conact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

ALTER TABLE "backers" ADD CONSTRAINT "fk_backers_first_name_last_name" FOREIGN KEY("first_name", "last_name")
REFERENCES "contacts" ("first_name", "last_name");


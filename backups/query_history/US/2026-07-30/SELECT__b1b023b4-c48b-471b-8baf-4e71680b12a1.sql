-- job_id: b1b023b4-c48b-471b-8baf-4e71680b12a1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T15:31:38.433000+00:00
-- started: 2026-07-30T15:31:38.793000+00:00
-- ended: 2026-07-30T15:31:38.914000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

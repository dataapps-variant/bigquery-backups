-- job_id: 7f51d69c-64b7-4b68-a04f-76385df84a26
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:42:27.681000+00:00
-- started: 2026-07-30T16:42:27.802000+00:00
-- ended: 2026-07-30T16:42:27.939000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

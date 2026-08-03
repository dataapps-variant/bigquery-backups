-- job_id: fa433d92-b030-4fe8-ba20-f08c8b54d5a2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:26:30.951000+00:00
-- started: 2026-07-31T13:26:31.128000+00:00
-- ended: 2026-07-31T13:26:31.219000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

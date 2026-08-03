-- job_id: 8736a3c7-4790-4040-92ac-cd797a8f1b23
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:54:29.066000+00:00
-- started: 2026-08-03T12:54:29.183000+00:00
-- ended: 2026-08-03T12:54:29.405000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

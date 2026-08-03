-- job_id: b7ea3883-9cb9-4bee-a0f1-c049cc575648
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:03:28.383000+00:00
-- started: 2026-07-31T10:03:28.510000+00:00
-- ended: 2026-07-31T10:03:28.756000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

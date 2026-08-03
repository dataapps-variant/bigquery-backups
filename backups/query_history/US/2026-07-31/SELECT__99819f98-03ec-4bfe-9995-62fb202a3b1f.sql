-- job_id: 99819f98-03ec-4bfe-9995-62fb202a3b1f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T19:13:41.550000+00:00
-- started: 2026-07-31T19:13:41.679000+00:00
-- ended: 2026-07-31T19:13:41.821000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

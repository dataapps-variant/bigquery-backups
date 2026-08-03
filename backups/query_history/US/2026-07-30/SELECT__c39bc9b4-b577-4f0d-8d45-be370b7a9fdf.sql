-- job_id: c39bc9b4-b577-4f0d-8d45-be370b7a9fdf
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:01:36.402000+00:00
-- started: 2026-07-30T14:01:36.505000+00:00
-- ended: 2026-07-30T14:01:36.627000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

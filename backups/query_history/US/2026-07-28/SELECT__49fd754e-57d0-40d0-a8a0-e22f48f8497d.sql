-- job_id: 49fd754e-57d0-40d0-a8a0-e22f48f8497d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:52:36.670000+00:00
-- started: 2026-07-28T15:52:36.764000+00:00
-- ended: 2026-07-28T15:52:36.989000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

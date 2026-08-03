-- job_id: b548d09b-4b1d-44d2-9c21-8d4a4f9eda90
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:56:27.389000+00:00
-- started: 2026-07-29T09:56:27.503000+00:00
-- ended: 2026-07-29T09:56:27.657000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

-- job_id: 09220ec1-ee9e-4cd1-9c95-211699df0631
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:56:27.474000+00:00
-- started: 2026-07-29T09:56:27.529000+00:00
-- ended: 2026-07-29T09:56:27.661000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

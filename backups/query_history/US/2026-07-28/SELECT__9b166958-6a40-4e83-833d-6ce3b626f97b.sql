-- job_id: 9b166958-6a40-4e83-833d-6ce3b626f97b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T05:33:55.071000+00:00
-- started: 2026-07-28T05:33:55.166000+00:00
-- ended: 2026-07-28T05:33:55.310000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

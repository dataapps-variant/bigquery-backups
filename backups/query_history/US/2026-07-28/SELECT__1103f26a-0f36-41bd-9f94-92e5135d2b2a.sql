-- job_id: 1103f26a-0f36-41bd-9f94-92e5135d2b2a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:25:45.259000+00:00
-- started: 2026-07-28T10:25:45.366000+00:00
-- ended: 2026-07-28T10:25:45.547000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

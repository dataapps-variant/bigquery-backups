-- job_id: 5fb0e1b4-0058-4fb2-86c9-b6e8279d9f24
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:47:14.310000+00:00
-- started: 2026-07-28T14:47:14.397000+00:00
-- ended: 2026-07-28T14:47:14.510000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

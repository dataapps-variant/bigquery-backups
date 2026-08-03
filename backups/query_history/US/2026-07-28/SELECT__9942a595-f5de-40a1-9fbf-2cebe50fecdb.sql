-- job_id: 9942a595-f5de-40a1-9fbf-2cebe50fecdb
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:53:35.113000+00:00
-- started: 2026-07-28T06:53:35.836000+00:00
-- ended: 2026-07-28T06:53:35.959000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

-- job_id: 559faba5-2243-4a39-b936-20507ad80ecb
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:46:35.246000+00:00
-- started: 2026-07-28T11:46:35.350000+00:00
-- ended: 2026-07-28T11:46:35.459000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

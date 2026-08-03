-- job_id: 39d4475c-ff57-4835-8a4e-666c6c2ddce7
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:15:25.362000+00:00
-- started: 2026-07-28T14:15:25.487000+00:00
-- ended: 2026-07-28T14:15:25.575000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

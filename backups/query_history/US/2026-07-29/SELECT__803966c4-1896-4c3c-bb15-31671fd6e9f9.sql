-- job_id: 803966c4-1896-4c3c-bb15-31671fd6e9f9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:56:09.653000+00:00
-- started: 2026-07-29T08:56:09.766000+00:00
-- ended: 2026-07-29T08:56:09.886000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

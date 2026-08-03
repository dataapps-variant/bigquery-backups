-- job_id: 1dfb8053-c0bf-48c3-8f2f-d2b2cd8eabb3
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:39.225000+00:00
-- started: 2026-07-29T09:53:39.314000+00:00
-- ended: 2026-07-29T09:53:39.492000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

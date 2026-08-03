-- job_id: 2e8a69af-1ad0-4f96-844c-c3154a6fa8bd
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T13:39:05.866000+00:00
-- started: 2026-07-27T13:39:05.967000+00:00
-- ended: 2026-07-27T13:39:06.068000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

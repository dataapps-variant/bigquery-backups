-- job_id: 747b5c8c-4c48-47a2-9cb2-a9d56e130ddf
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:39.859000+00:00
-- started: 2026-07-29T09:53:39.982000+00:00
-- ended: 2026-07-29T09:53:40.087000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

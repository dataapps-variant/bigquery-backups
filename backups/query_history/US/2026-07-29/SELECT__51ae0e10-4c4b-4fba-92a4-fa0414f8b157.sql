-- job_id: 51ae0e10-4c4b-4fba-92a4-fa0414f8b157
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:39.317000+00:00
-- started: 2026-07-29T09:53:39.396000+00:00
-- ended: 2026-07-29T09:53:39.547000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

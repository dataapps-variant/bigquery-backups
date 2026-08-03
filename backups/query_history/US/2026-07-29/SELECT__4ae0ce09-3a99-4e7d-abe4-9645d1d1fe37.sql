-- job_id: 4ae0ce09-3a99-4e7d-abe4-9645d1d1fe37
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:54:36.923000+00:00
-- started: 2026-07-29T09:54:37.019000+00:00
-- ended: 2026-07-29T09:54:37.148000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

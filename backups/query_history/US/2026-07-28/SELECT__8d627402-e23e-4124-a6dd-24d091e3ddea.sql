-- job_id: 8d627402-e23e-4124-a6dd-24d091e3ddea
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:39:22.096000+00:00
-- started: 2026-07-28T10:39:22.162000+00:00
-- ended: 2026-07-28T10:39:23.131000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

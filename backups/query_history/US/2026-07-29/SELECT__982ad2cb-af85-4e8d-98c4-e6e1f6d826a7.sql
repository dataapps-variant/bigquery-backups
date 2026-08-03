-- job_id: 982ad2cb-af85-4e8d-98c4-e6e1f6d826a7
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:35:25.228000+00:00
-- started: 2026-07-29T09:35:25.313000+00:00
-- ended: 2026-07-29T09:35:25.981000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

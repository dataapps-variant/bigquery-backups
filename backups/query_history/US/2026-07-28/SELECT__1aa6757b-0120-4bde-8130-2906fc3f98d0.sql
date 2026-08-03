-- job_id: 1aa6757b-0120-4bde-8130-2906fc3f98d0
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:46:53.363000+00:00
-- started: 2026-07-28T14:46:53.471000+00:00
-- ended: 2026-07-28T14:46:53.590000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

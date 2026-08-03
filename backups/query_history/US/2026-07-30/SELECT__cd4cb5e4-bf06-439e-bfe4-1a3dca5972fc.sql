-- job_id: cd4cb5e4-bf06-439e-bfe4-1a3dca5972fc
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:46:14.473000+00:00
-- started: 2026-07-30T13:46:14.567000+00:00
-- ended: 2026-07-30T13:46:14.668000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

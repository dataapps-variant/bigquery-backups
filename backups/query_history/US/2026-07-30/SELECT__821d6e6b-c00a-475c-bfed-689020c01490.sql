-- job_id: 821d6e6b-c00a-475c-bfed-689020c01490
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T15:31:41.148000+00:00
-- started: 2026-07-30T15:31:41.274000+00:00
-- ended: 2026-07-30T15:31:41.393000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

-- job_id: bb2d23dd-ff35-4c99-b44f-98772b8a4efb
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:07:58.787000+00:00
-- started: 2026-07-30T11:07:58.905000+00:00
-- ended: 2026-07-30T11:07:59.027000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

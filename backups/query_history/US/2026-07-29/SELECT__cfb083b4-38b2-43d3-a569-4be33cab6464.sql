-- job_id: cfb083b4-38b2-43d3-a569-4be33cab6464
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:35:36.742000+00:00
-- started: 2026-07-29T17:35:36.867000+00:00
-- ended: 2026-07-29T17:35:36.994000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

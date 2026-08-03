-- job_id: f458c346-a4f8-42e2-8421-64df339ef80b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:06:31.507000+00:00
-- started: 2026-07-29T13:06:31.596000+00:00
-- ended: 2026-07-29T13:06:31.917000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

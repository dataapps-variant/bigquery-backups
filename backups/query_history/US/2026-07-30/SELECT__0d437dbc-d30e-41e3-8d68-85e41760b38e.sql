-- job_id: 0d437dbc-d30e-41e3-8d68-85e41760b38e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:01:38.816000+00:00
-- started: 2026-07-30T14:01:38.938000+00:00
-- ended: 2026-07-30T14:01:39.111000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

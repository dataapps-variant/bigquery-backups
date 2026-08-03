-- job_id: c72f8776-5615-4f05-a1fe-ad0a5af5ccae
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:35:37.576000+00:00
-- started: 2026-07-30T13:35:37.687000+00:00
-- ended: 2026-07-30T13:35:37.810000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

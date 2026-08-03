-- job_id: b3b7f3b2-6835-4579-8968-76e1e52a6743
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:08:35.920000+00:00
-- started: 2026-07-29T11:08:36.117000+00:00
-- ended: 2026-07-29T11:08:36.326000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IN UNNEST(@countries) AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

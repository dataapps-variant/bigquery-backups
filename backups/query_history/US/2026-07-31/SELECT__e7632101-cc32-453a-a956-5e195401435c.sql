-- job_id: e7632101-cc32-453a-a956-5e195401435c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:12:02.111000+00:00
-- started: 2026-07-31T09:12:02.212000+00:00
-- ended: 2026-07-31T09:12:02.343000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

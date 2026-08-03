-- job_id: eabebfc4-4bfc-421d-8de7-10e37e22269e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T17:32:34.664000+00:00
-- started: 2026-07-30T17:32:34.808000+00:00
-- ended: 2026-07-30T17:32:35.064000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

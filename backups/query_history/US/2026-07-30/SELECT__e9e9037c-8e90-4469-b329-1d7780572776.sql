-- job_id: e9e9037c-8e90-4469-b329-1d7780572776
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T17:32:36.575000+00:00
-- started: 2026-07-30T17:32:36.712000+00:00
-- ended: 2026-07-30T17:32:37.271000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscription_users`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Report_date` = (SELECT MAX(`Report_date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`) GROUP BY a, c) ORDER BY a, cs DESC, c

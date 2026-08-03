-- job_id: 3c8217e9-eea2-46ff-bcd0-5ae32a4af901
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:12:03.910000+00:00
-- started: 2026-07-31T09:12:04.049000+00:00
-- ended: 2026-07-31T09:12:04.166000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscription_users`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Report_date` = (SELECT MAX(`Report_date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`) GROUP BY a, c) ORDER BY a, cs DESC, c

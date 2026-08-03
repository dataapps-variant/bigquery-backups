-- job_id: 9b083e70-f7e4-4bde-8baf-ddf23dc057bf
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T06:53:36.784000+00:00
-- started: 2026-07-28T06:53:36.877000+00:00
-- ended: 2026-07-28T06:53:37.005000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscription_users`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Report_date` = (SELECT MAX(`Report_date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`) GROUP BY a, c) ORDER BY a, cs DESC, c

-- job_id: 82ee69cb-8611-4223-a353-d05a93b149be
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:40.349000+00:00
-- started: 2026-07-29T09:53:40.665000+00:00
-- ended: 2026-07-29T09:53:40.852000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscription_users`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Report_date` = (SELECT MAX(`Report_date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`) GROUP BY a, c) ORDER BY a, cs DESC, c

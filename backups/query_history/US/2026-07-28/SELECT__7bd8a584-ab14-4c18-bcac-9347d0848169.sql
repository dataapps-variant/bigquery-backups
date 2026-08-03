-- job_id: 7bd8a584-ab14-4c18-bcac-9347d0848169
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:47:30.753000+00:00
-- started: 2026-07-28T14:47:30.827000+00:00
-- ended: 2026-07-28T14:47:30.941000+00:00

SELECT a, p, c FROM (SELECT a, p, c, cs, SUM(cs) OVER (PARTITION BY a, p) AS pt, SUM(cs) OVER (PARTITION BY a, c) AS ct FROM (SELECT `App_Name` AS a, `Product_Name_Final` AS p, `Spend_Country_Code_AFID` AS c, SUM(`Subscription_users`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `App_Name` IS NOT NULL AND `Product_Name_Final` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Report_date` = (SELECT MAX(`Report_date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`) GROUP BY a, p, c)) ORDER BY a, pt DESC, p, ct DESC, cs DESC

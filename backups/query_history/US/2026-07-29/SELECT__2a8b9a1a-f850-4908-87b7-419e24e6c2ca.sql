-- job_id: 2a8b9a1a-f850-4908-87b7-419e24e6c2ca
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:57:07.676000+00:00
-- started: 2026-07-29T09:57:07.769000+00:00
-- ended: 2026-07-29T09:57:07.873000+00:00

SELECT a, p, c FROM (SELECT a, p, c, cs, SUM(cs) OVER (PARTITION BY a, p) AS pt, SUM(cs) OVER (PARTITION BY a, c) AS ct FROM (SELECT `App_Name` AS a, `Product_Name_Final` AS p, `Spend_Country_Code_AFID` AS c, SUM(`Subscription_users`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `App_Name` IS NOT NULL AND `Product_Name_Final` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Report_date` = (SELECT MAX(`Report_date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`) GROUP BY a, p, c)) ORDER BY a, pt DESC, p, ct DESC, cs DESC

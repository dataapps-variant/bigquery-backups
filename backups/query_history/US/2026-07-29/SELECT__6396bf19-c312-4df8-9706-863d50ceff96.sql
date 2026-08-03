-- job_id: 6396bf19-c312-4df8-9706-863d50ceff96
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:38.229000+00:00
-- started: 2026-07-29T09:53:38.295000+00:00
-- ended: 2026-07-29T09:53:38.476000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

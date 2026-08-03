-- job_id: 6f151577-3cc5-42aa-88b7-fcdd84381594
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:56:25.535000+00:00
-- started: 2026-07-29T09:56:25.722000+00:00
-- ended: 2026-07-29T09:56:26.547000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

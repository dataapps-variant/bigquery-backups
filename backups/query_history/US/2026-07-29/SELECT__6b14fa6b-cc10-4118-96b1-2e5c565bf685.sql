-- job_id: 6b14fa6b-cc10-4118-96b1-2e5c565bf685
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:38.191000+00:00
-- started: 2026-07-29T09:53:38.290000+00:00
-- ended: 2026-07-29T09:53:38.435000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

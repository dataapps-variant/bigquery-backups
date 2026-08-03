-- job_id: 6743395b-5925-4a82-8b7b-5955493accb9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:56:25.625000+00:00
-- started: 2026-07-29T09:56:25.700000+00:00
-- ended: 2026-07-29T09:56:26.555000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

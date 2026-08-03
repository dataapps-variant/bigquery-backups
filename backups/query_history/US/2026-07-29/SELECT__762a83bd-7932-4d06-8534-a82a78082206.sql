-- job_id: 762a83bd-7932-4d06-8534-a82a78082206
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:38.153000+00:00
-- started: 2026-07-29T09:53:38.236000+00:00
-- ended: 2026-07-29T09:53:38.394000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

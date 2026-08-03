-- job_id: df45786a-828c-4bdb-8fe1-7ddd9ad364f4
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:35:24.133000+00:00
-- started: 2026-07-29T09:35:24.230000+00:00
-- ended: 2026-07-29T09:35:24.414000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

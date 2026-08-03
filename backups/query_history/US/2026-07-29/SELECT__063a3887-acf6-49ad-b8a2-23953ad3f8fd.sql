-- job_id: 063a3887-acf6-49ad-b8a2-23953ad3f8fd
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:54:35.659000+00:00
-- started: 2026-07-29T09:54:35.746000+00:00
-- ended: 2026-07-29T09:54:35.996000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

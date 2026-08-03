-- job_id: b0cd9eb6-1474-4e22-9145-fbcf1c2d201b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:49:56.590000+00:00
-- started: 2026-07-28T16:49:56.709000+00:00
-- ended: 2026-07-28T16:49:56.936000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

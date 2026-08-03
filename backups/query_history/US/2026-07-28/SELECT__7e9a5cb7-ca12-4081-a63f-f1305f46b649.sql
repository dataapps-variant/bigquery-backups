-- job_id: 7e9a5cb7-ca12-4081-a63f-f1305f46b649
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:39:20.709000+00:00
-- started: 2026-07-28T10:39:21.173000+00:00
-- ended: 2026-07-28T10:39:21.337000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

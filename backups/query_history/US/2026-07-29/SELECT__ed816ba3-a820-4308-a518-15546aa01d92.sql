-- job_id: ed816ba3-a820-4308-a518-15546aa01d92
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:56:08.284000+00:00
-- started: 2026-07-29T08:56:08.367000+00:00
-- ended: 2026-07-29T08:56:08.752000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

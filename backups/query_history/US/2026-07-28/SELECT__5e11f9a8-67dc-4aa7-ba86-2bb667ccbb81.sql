-- job_id: 5e11f9a8-67dc-4aa7-ba86-2bb667ccbb81
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:47:13.226000+00:00
-- started: 2026-07-28T14:47:13.324000+00:00
-- ended: 2026-07-28T14:47:13.423000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

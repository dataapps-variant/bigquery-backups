-- job_id: 2f4051ab-788a-46ef-89c6-595076ccb182
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:38.562000+00:00
-- started: 2026-07-29T09:53:38.656000+00:00
-- ended: 2026-07-29T09:53:38.748000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

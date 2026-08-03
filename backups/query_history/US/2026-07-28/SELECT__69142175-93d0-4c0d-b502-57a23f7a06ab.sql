-- job_id: 69142175-93d0-4c0d-b502-57a23f7a06ab
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:46:52.282000+00:00
-- started: 2026-07-28T14:46:52.379000+00:00
-- ended: 2026-07-28T14:46:52.502000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

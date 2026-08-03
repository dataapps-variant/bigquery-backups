-- job_id: 5034bfa3-fd3b-481e-b790-7f4a5927374b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T13:39:04.803000+00:00
-- started: 2026-07-27T13:39:04.895000+00:00
-- ended: 2026-07-27T13:39:05.029000+00:00

SELECT `Product_Name_Final` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Product_Name_Final` IS NOT NULL GROUP BY p ORDER BY c DESC

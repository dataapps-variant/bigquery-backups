-- job_id: 67cd9053-6157-45fa-921b-c0183df6fc29
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:53:39.348000+00:00
-- started: 2026-07-29T09:53:39.422000+00:00
-- ended: 2026-07-29T09:53:39.534000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC

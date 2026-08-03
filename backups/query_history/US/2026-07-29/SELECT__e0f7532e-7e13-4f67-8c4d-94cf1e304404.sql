-- job_id: e0f7532e-7e13-4f67-8c4d-94cf1e304404
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:34:00.733000+00:00
-- started: 2026-07-29T13:34:00.895000+00:00
-- ended: 2026-07-29T13:34:01.042000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

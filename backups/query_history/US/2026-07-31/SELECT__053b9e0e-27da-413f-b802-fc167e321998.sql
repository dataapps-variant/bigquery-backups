-- job_id: 053b9e0e-27da-413f-b802-fc167e321998
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:44:55.945000+00:00
-- started: 2026-07-31T13:44:56.034000+00:00
-- ended: 2026-07-31T13:44:56.166000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

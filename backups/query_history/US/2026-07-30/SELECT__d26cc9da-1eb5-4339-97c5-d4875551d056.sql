-- job_id: d26cc9da-1eb5-4339-97c5-d4875551d056
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:46:13.354000+00:00
-- started: 2026-07-30T13:46:13.455000+00:00
-- ended: 2026-07-30T13:46:13.560000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

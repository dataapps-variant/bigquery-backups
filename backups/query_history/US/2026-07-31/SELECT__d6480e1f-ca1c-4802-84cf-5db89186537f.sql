-- job_id: d6480e1f-ca1c-4802-84cf-5db89186537f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:41:53.354000+00:00
-- started: 2026-07-31T12:41:53.468000+00:00
-- ended: 2026-07-31T12:41:53.586000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

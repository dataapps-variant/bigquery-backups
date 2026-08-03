-- job_id: 24e70951-cf20-46c7-8bf9-99e824d52caa
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:14:04.601000+00:00
-- started: 2026-07-29T13:14:04.716000+00:00
-- ended: 2026-07-29T13:14:04.838000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

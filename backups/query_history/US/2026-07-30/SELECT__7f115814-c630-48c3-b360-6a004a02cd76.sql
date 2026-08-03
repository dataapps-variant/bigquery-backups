-- job_id: 7f115814-c630-48c3-b360-6a004a02cd76
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:07:57.258000+00:00
-- started: 2026-07-30T11:07:57.387000+00:00
-- ended: 2026-07-30T11:07:57.742000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

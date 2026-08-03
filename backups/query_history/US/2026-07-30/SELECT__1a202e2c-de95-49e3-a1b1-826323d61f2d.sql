-- job_id: 1a202e2c-de95-49e3-a1b1-826323d61f2d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T11:07:57.687000+00:00
-- started: 2026-07-30T11:07:57.814000+00:00
-- ended: 2026-07-30T11:07:57.926000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

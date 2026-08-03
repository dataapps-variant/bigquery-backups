-- job_id: 884017a6-2310-4da2-8887-07cb91e3f495
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:47:51.865000+00:00
-- started: 2026-07-31T16:47:52.006000+00:00
-- ended: 2026-07-31T16:47:52.124000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

-- job_id: 80a096b0-b507-4a8b-8568-7c63f6511bcf
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:36:10.754000+00:00
-- started: 2026-07-31T15:36:10.853000+00:00
-- ended: 2026-07-31T15:36:10.986000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

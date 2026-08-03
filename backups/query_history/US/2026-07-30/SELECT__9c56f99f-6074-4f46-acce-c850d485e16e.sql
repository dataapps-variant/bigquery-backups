-- job_id: 9c56f99f-6074-4f46-acce-c850d485e16e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T23:52:59.828000+00:00
-- started: 2026-07-30T23:52:59.952000+00:00
-- ended: 2026-07-30T23:53:00.069000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

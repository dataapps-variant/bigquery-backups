-- job_id: d2865574-1158-41eb-a0b9-7d2c1c7cd0c6
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:00:21.417000+00:00
-- started: 2026-07-31T14:00:21.521000+00:00
-- ended: 2026-07-31T14:00:21.798000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC

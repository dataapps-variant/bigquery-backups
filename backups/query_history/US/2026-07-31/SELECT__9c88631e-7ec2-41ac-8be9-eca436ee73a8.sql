-- job_id: 9c88631e-7ec2-41ac-8be9-eca436ee73a8
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:41:52.250000+00:00
-- started: 2026-07-31T12:41:52.387000+00:00
-- ended: 2026-07-31T12:41:52.510000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

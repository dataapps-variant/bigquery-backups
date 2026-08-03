-- job_id: 7017cb3b-8a19-4439-85f3-a00146588160
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:08:45.520000+00:00
-- started: 2026-07-30T09:08:45.674000+00:00
-- ended: 2026-07-30T09:08:45.882000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

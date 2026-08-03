-- job_id: 67543b55-e75f-4dd4-8c0e-b8d0f17ab22e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:46:12.258000+00:00
-- started: 2026-07-30T13:46:12.394000+00:00
-- ended: 2026-07-30T13:46:12.502000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

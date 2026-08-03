-- job_id: 791b72f2-daae-4cc1-99b4-961ad7cb1f1c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:47:39.936000+00:00
-- started: 2026-07-30T13:47:40.065000+00:00
-- ended: 2026-07-30T13:47:40.170000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

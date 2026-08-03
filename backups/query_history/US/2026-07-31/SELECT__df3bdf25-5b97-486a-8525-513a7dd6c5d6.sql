-- job_id: df3bdf25-5b97-486a-8525-513a7dd6c5d6
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:20:03.060000+00:00
-- started: 2026-07-31T13:20:03.158000+00:00
-- ended: 2026-07-31T13:20:03.327000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

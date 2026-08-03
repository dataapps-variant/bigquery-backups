-- job_id: 312bc5d8-60e5-4d5d-975c-a1a0cceab2d1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:36:14.200000+00:00
-- started: 2026-07-31T15:36:14.666000+00:00
-- ended: 2026-07-31T15:36:14.771000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

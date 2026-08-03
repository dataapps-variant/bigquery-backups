-- job_id: 976e5d12-74be-4ee5-b530-fb8b3b0de72c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:48:22.356000+00:00
-- started: 2026-07-31T12:48:22.463000+00:00
-- ended: 2026-07-31T12:48:22.591000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

-- job_id: 76d8a509-8165-4f82-8797-e0d59656996c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:26:36.840000+00:00
-- started: 2026-07-31T13:26:36.958000+00:00
-- ended: 2026-07-31T13:26:37.139000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

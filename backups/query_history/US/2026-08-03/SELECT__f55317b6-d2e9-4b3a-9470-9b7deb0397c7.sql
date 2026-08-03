-- job_id: f55317b6-d2e9-4b3a-9470-9b7deb0397c7
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:54:35.739000+00:00
-- started: 2026-08-03T12:54:35.840000+00:00
-- ended: 2026-08-03T12:54:36.075000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

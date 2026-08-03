-- job_id: c59afac0-3675-4b08-8bd7-a8928ceceeca
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:45:56.551000+00:00
-- started: 2026-07-30T13:45:56.617000+00:00
-- ended: 2026-07-30T13:45:56.742000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

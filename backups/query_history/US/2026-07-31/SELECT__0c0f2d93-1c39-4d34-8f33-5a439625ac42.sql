-- job_id: 0c0f2d93-1c39-4d34-8f33-5a439625ac42
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:20.252000+00:00
-- started: 2026-07-31T13:42:20.341000+00:00
-- ended: 2026-07-31T13:42:20.468000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

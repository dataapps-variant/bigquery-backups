-- job_id: 040adf4b-2ce2-4a13-8d43-9f7946ae535f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T19:13:46.427000+00:00
-- started: 2026-07-31T19:13:46.560000+00:00
-- ended: 2026-07-31T19:13:46.687000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

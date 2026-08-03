-- job_id: da7f1da7-7aa8-4151-982c-3d16a5d8136a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:47:45.257000+00:00
-- started: 2026-07-30T13:47:45.348000+00:00
-- ended: 2026-07-30T13:47:45.454000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

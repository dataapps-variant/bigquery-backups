-- job_id: 04fd207e-6f27-4779-bb1f-16ae60e54cf0
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:17:00.927000+00:00
-- started: 2026-07-31T13:17:01.039000+00:00
-- ended: 2026-07-31T13:17:01.154000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

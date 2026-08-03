-- job_id: 3515392a-90cc-4864-a3e2-559972bb443e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T15:31:43.578000+00:00
-- started: 2026-07-30T15:31:43.727000+00:00
-- ended: 2026-07-30T15:31:43.847000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

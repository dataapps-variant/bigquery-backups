-- job_id: 8fda320a-a7cb-4d86-a597-2a40b47aca27
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:49:12.337000+00:00
-- started: 2026-07-29T14:49:12.428000+00:00
-- ended: 2026-07-29T14:49:12.554000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

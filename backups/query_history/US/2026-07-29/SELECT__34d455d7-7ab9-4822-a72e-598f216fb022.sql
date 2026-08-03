-- job_id: 34d455d7-7ab9-4822-a72e-598f216fb022
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:06:34.244000+00:00
-- started: 2026-07-29T13:06:34.342000+00:00
-- ended: 2026-07-29T13:06:34.526000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

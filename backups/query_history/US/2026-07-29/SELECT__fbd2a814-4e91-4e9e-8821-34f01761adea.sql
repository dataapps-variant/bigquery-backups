-- job_id: fbd2a814-4e91-4e9e-8821-34f01761adea
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:34:05+00:00
-- started: 2026-07-29T13:34:05.187000+00:00
-- ended: 2026-07-29T13:34:05.304000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

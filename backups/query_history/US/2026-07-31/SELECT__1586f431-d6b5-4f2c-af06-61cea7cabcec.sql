-- job_id: 1586f431-d6b5-4f2c-af06-61cea7cabcec
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:22:51.975000+00:00
-- started: 2026-07-31T11:22:52.082000+00:00
-- ended: 2026-07-31T11:22:52.183000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

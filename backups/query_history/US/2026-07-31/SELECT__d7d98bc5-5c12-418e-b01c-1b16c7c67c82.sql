-- job_id: d7d98bc5-5c12-418e-b01c-1b16c7c67c82
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:26:07.581000+00:00
-- started: 2026-07-31T13:26:07.691000+00:00
-- ended: 2026-07-31T13:26:07.835000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

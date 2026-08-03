-- job_id: 1f3df76e-47ab-4755-83d6-9f40b097b71a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:00:51.064000+00:00
-- started: 2026-07-31T13:00:51.343000+00:00
-- ended: 2026-07-31T13:00:51.466000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

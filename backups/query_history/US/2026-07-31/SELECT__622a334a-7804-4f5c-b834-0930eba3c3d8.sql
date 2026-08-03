-- job_id: 622a334a-7804-4f5c-b834-0930eba3c3d8
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:44:59.744000+00:00
-- started: 2026-07-31T13:44:59.853000+00:00
-- ended: 2026-07-31T13:45:00.067000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

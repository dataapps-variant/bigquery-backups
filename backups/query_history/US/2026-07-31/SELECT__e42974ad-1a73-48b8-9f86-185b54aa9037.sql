-- job_id: e42974ad-1a73-48b8-9f86-185b54aa9037
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:45:14.700000+00:00
-- started: 2026-07-31T13:45:14.790000+00:00
-- ended: 2026-07-31T13:45:14.907000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

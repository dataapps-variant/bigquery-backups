-- job_id: 491f898c-3756-41c8-9737-e98c2a97290b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:08:50.276000+00:00
-- started: 2026-07-30T09:08:50.450000+00:00
-- ended: 2026-07-30T09:08:50.646000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

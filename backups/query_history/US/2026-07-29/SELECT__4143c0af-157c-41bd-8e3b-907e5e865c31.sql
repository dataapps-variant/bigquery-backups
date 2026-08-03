-- job_id: 4143c0af-157c-41bd-8e3b-907e5e865c31
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:36:52.379000+00:00
-- started: 2026-07-29T19:36:52.488000+00:00
-- ended: 2026-07-29T19:36:52.616000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

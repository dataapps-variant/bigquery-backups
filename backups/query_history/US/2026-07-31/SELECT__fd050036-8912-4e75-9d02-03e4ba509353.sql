-- job_id: fd050036-8912-4e75-9d02-03e4ba509353
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:21.227000+00:00
-- started: 2026-07-31T13:42:21.355000+00:00
-- ended: 2026-07-31T13:42:21.443000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

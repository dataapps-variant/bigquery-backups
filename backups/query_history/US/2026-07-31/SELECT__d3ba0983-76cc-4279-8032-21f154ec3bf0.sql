-- job_id: d3ba0983-76cc-4279-8032-21f154ec3bf0
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:26:51.321000+00:00
-- started: 2026-07-31T13:26:51.647000+00:00
-- ended: 2026-07-31T13:26:51.761000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

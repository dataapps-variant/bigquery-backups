-- job_id: bc2a532b-738b-4d0f-a9dd-f34de4cec0a5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:37:07.409000+00:00
-- started: 2026-07-29T17:37:07.508000+00:00
-- ended: 2026-07-29T17:37:07.590000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

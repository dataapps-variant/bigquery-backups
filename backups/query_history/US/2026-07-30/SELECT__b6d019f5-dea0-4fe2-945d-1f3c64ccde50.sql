-- job_id: b6d019f5-dea0-4fe2-945d-1f3c64ccde50
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:46:16.628000+00:00
-- started: 2026-07-30T13:46:16.728000+00:00
-- ended: 2026-07-30T13:46:16.851000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

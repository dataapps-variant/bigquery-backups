-- job_id: b24aa53d-4eab-4405-a623-6673d3459706
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:01:35.034000+00:00
-- started: 2026-07-31T13:01:35.150000+00:00
-- ended: 2026-07-31T13:01:35.275000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

-- job_id: 1d253aa8-1bbc-4b5a-b1bf-20414f6c4f3e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T22:00:59.671000+00:00
-- started: 2026-07-31T22:00:59.807000+00:00
-- ended: 2026-07-31T22:00:59.971000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

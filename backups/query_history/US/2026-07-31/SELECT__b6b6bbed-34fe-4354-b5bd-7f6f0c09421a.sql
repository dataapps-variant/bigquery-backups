-- job_id: b6b6bbed-34fe-4354-b5bd-7f6f0c09421a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:45:16.185000+00:00
-- started: 2026-07-31T13:45:16.260000+00:00
-- ended: 2026-07-31T13:45:16.387000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

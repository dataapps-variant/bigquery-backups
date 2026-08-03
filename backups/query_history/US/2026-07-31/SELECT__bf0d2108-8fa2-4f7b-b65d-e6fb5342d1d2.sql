-- job_id: bf0d2108-8fa2-4f7b-b65d-e6fb5342d1d2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:30:14.817000+00:00
-- started: 2026-07-31T12:30:14.927000+00:00
-- ended: 2026-07-31T12:30:15.170000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

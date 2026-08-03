-- job_id: 5996dce3-3a38-42ee-92c1-1dc6e4536263
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:20:26.497000+00:00
-- started: 2026-07-29T19:20:26.593000+00:00
-- ended: 2026-07-29T19:20:26.890000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

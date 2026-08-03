-- job_id: a12bacc0-17e9-4060-a087-e33cff1a9c7a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:46:10.735000+00:00
-- started: 2026-07-30T13:46:10.858000+00:00
-- ended: 2026-07-30T13:46:10.993000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

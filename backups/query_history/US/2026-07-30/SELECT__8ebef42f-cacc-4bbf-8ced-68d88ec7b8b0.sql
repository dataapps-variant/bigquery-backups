-- job_id: 8ebef42f-cacc-4bbf-8ced-68d88ec7b8b0
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:46:30.435000+00:00
-- started: 2026-07-30T13:46:30.547000+00:00
-- ended: 2026-07-30T13:46:30.650000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

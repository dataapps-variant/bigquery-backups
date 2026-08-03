-- job_id: f6f853cd-cd8c-4da7-a92b-7e72d5f60b35
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:06:48.040000+00:00
-- started: 2026-07-29T13:06:48.129000+00:00
-- ended: 2026-07-29T13:06:48.401000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

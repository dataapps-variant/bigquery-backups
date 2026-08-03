-- job_id: 123a05c2-6bd0-4547-aefd-7f2a95328d3e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:09:05.249000+00:00
-- started: 2026-07-30T09:09:05.366000+00:00
-- ended: 2026-07-30T09:09:05.645000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

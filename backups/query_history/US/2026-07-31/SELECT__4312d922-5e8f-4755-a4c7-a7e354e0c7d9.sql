-- job_id: 4312d922-5e8f-4755-a4c7-a7e354e0c7d9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:26:52.658000+00:00
-- started: 2026-07-31T13:26:52.735000+00:00
-- ended: 2026-07-31T13:26:52.868000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

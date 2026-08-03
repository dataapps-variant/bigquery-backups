-- job_id: 21a58c44-9cd0-4c1b-a9a3-0cb7e817d789
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:34:19.435000+00:00
-- started: 2026-07-29T13:34:19.524000+00:00
-- ended: 2026-07-29T13:34:19.657000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

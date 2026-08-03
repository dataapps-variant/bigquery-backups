-- job_id: 8e4a8d31-12a2-46ed-aec2-05c6b4481d6d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:35:55.082000+00:00
-- started: 2026-07-29T17:35:55.378000+00:00
-- ended: 2026-07-29T17:35:55.490000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

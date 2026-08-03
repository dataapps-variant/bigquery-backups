-- job_id: 2d12bb39-8aff-4621-ac8d-e84c4bf8d948
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T13:02:25.751000+00:00
-- started: 2026-08-03T13:02:25.856000+00:00
-- ended: 2026-08-03T13:02:26.018000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

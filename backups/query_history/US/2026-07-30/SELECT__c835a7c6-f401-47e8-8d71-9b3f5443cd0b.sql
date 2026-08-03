-- job_id: c835a7c6-f401-47e8-8d71-9b3f5443cd0b
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:35:39.241000+00:00
-- started: 2026-07-30T13:35:39.333000+00:00
-- ended: 2026-07-30T13:35:39.433000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

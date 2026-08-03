-- job_id: aed65da4-c3ef-43ef-9171-7ad92e3cc627
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T11:20:07.090000+00:00
-- started: 2026-07-31T11:20:07.265000+00:00
-- ended: 2026-07-31T11:20:07.394000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

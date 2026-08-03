-- job_id: c245452f-e42c-414a-99e6-ab779c7187a7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:48:42.427000+00:00
-- started: 2026-07-30T12:48:42.553000+00:00
-- ended: 2026-07-30T12:48:42.916000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

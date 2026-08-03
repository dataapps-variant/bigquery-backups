-- job_id: 42469962-6fd9-428b-887f-4d6038718b8f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:52:03.524000+00:00
-- started: 2026-07-31T10:52:03.626000+00:00
-- ended: 2026-07-31T10:52:03.724000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

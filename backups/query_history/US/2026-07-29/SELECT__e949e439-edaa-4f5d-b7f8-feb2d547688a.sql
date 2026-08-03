-- job_id: e949e439-edaa-4f5d-b7f8-feb2d547688a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:04:00.928000+00:00
-- started: 2026-07-29T12:04:01.070000+00:00
-- ended: 2026-07-29T12:04:01.205000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

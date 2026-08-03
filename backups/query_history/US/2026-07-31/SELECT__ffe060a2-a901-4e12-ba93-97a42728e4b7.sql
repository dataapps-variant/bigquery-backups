-- job_id: ffe060a2-a901-4e12-ba93-97a42728e4b7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:52:10.715000+00:00
-- started: 2026-07-31T10:52:10.822000+00:00
-- ended: 2026-07-31T10:52:10.907000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

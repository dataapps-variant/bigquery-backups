-- job_id: c1112d45-899e-4030-8dac-f383249ee7f5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:52:21.063000+00:00
-- started: 2026-07-30T13:52:21.179000+00:00
-- ended: 2026-07-30T13:52:21.287000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

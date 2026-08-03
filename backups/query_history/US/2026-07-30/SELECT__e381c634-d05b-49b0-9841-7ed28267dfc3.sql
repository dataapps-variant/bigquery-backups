-- job_id: e381c634-d05b-49b0-9841-7ed28267dfc3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:05:18.241000+00:00
-- started: 2026-07-30T13:05:18.400000+00:00
-- ended: 2026-07-30T13:05:18.508000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

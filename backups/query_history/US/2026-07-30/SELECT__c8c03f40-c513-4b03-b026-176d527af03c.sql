-- job_id: c8c03f40-c513-4b03-b026-176d527af03c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:00:00.597000+00:00
-- started: 2026-07-30T13:00:00.720000+00:00
-- ended: 2026-07-30T13:00:00.846000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

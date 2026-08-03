-- job_id: acc9ce18-3332-41f8-a7a8-03861f9fd6a3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:24.913000+00:00
-- started: 2026-07-31T10:51:25.148000+00:00
-- ended: 2026-07-31T10:51:25.369000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

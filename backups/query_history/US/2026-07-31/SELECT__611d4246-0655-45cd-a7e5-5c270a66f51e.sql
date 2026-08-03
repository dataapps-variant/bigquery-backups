-- job_id: 611d4246-0655-45cd-a7e5-5c270a66f51e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T13:04:28.127000+00:00
-- started: 2026-07-31T13:04:28.254000+00:00
-- ended: 2026-07-31T13:04:28.376000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

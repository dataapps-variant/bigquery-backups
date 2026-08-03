-- job_id: 16714513-69d6-4475-ba18-9c3ed2e61f57
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:52:12.414000+00:00
-- started: 2026-07-31T10:52:12.544000+00:00
-- ended: 2026-07-31T10:52:12.662000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

-- job_id: 834fd3b0-4138-4468-b6cf-f793fcfcf656
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:47:10.213000+00:00
-- started: 2026-07-31T12:47:10.301000+00:00
-- ended: 2026-07-31T12:47:10.523000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball' AND `Net_LTV_Discounted` IS NOT NULL

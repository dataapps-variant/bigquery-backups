-- job_id: 3222c763-fa4c-460a-8d20-af397b55ef0a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:48:03.134000+00:00
-- started: 2026-07-29T11:48:03.269000+00:00
-- ended: 2026-07-29T11:48:03.385000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball'

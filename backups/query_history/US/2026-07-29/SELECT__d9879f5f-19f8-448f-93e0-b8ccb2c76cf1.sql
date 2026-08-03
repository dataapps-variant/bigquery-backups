-- job_id: d9879f5f-19f8-448f-93e0-b8ccb2c76cf1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:45:27.476000+00:00
-- started: 2026-07-29T11:45:27.581000+00:00
-- ended: 2026-07-29T11:45:27.690000+00:00

SELECT MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort AND `Table` = 'Crystal Ball'

-- job_id: 685b590e-84ca-4421-9d27-ea67bdffe92e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:45:42.863000+00:00
-- started: 2026-07-29T11:45:42.964000+00:00
-- ended: 2026-07-29T11:45:43.410000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

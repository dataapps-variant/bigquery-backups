-- job_id: 6d1000b3-ba0d-4016-bb4a-377df327c711
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:48:36.591000+00:00
-- started: 2026-07-30T12:48:36.718000+00:00
-- ended: 2026-07-30T12:48:36.912000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

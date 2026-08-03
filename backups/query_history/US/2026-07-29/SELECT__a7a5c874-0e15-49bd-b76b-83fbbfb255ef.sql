-- job_id: a7a5c874-0e15-49bd-b76b-83fbbfb255ef
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:03:56.215000+00:00
-- started: 2026-07-29T12:03:56.322000+00:00
-- ended: 2026-07-29T12:03:56.418000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

-- job_id: 82f2acc4-a952-43af-8e55-e1c624ec95f3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T12:50:34.866000+00:00
-- started: 2026-08-03T12:50:34.968000+00:00
-- ended: 2026-08-03T12:50:35.090000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

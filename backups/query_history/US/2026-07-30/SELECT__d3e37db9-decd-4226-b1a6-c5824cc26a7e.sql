-- job_id: d3e37db9-decd-4226-b1a6-c5824cc26a7e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:53:46.331000+00:00
-- started: 2026-07-30T13:53:46.431000+00:00
-- ended: 2026-07-30T13:53:46.551000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

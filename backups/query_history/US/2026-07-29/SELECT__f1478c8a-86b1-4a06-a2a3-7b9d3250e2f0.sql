-- job_id: f1478c8a-86b1-4a06-a2a3-7b9d3250e2f0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:45:22.252000+00:00
-- started: 2026-07-29T11:45:22.415000+00:00
-- ended: 2026-07-29T11:45:22.543000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

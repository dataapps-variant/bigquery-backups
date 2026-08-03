-- job_id: 6d8faca1-bbde-4a5a-a6e4-44a2498f0281
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:33:47.248000+00:00
-- started: 2026-07-29T11:33:47.388000+00:00
-- ended: 2026-07-29T11:33:47.470000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

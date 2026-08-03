-- job_id: cb0e87bf-e6e5-4e8e-b292-7938a539b320
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:47:59.965000+00:00
-- started: 2026-07-29T11:48:00.139000+00:00
-- ended: 2026-07-29T11:48:00.260000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

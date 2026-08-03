-- job_id: 6ef03837-f64c-4d90-aee5-fd08a76c3537
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:50:02.319000+00:00
-- started: 2026-07-29T11:50:02.461000+00:00
-- ended: 2026-07-29T11:50:02.556000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

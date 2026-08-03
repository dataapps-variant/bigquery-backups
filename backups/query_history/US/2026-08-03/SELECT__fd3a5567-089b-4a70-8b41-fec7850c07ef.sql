-- job_id: fd3a5567-089b-4a70-8b41-fec7850c07ef
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T13:02:18.706000+00:00
-- started: 2026-08-03T13:02:18.880000+00:00
-- ended: 2026-08-03T13:02:19.043000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

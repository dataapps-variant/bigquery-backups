-- job_id: 32eb06c2-412c-45dc-a7ca-864c36b69a97
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T13:02:23.977000+00:00
-- started: 2026-08-03T13:02:24.079000+00:00
-- ended: 2026-08-03T13:02:24.260000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

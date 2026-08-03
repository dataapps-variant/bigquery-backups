-- job_id: 8538aadd-4bf2-427d-acf6-cb25b16bd732
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:59:55.240000+00:00
-- started: 2026-07-30T12:59:55.348000+00:00
-- ended: 2026-07-30T12:59:55.497000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

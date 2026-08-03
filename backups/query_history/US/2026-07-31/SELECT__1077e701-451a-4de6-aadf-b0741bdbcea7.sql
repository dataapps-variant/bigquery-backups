-- job_id: 1077e701-451a-4de6-aadf-b0741bdbcea7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:47:04.970000+00:00
-- started: 2026-07-31T12:47:05.073000+00:00
-- ended: 2026-07-31T12:47:05.271000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

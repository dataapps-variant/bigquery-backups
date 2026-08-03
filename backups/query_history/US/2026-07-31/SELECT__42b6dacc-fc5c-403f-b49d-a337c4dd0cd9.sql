-- job_id: 42b6dacc-fc5c-403f-b49d-a337c4dd0cd9
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:35.806000+00:00
-- started: 2026-07-31T10:51:35.886000+00:00
-- ended: 2026-07-31T10:51:36.004000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

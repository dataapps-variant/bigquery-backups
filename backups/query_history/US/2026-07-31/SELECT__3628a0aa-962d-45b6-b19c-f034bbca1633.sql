-- job_id: 3628a0aa-962d-45b6-b19c-f034bbca1633
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T11:20:01.144000+00:00
-- started: 2026-07-31T11:20:01.263000+00:00
-- ended: 2026-07-31T11:20:01.391000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

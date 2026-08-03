-- job_id: 99cf60b5-3526-4d4a-a40d-5877fee37a26
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:52:18.821000+00:00
-- started: 2026-07-30T13:52:19.268000+00:00
-- ended: 2026-07-30T13:52:19.513000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

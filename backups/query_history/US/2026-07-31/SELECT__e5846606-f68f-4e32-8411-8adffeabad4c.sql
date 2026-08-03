-- job_id: e5846606-f68f-4e32-8411-8adffeabad4c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:49:49.146000+00:00
-- started: 2026-07-31T10:49:49.398000+00:00
-- ended: 2026-07-31T10:49:49.594000+00:00

SELECT MIN(`Reporting_Date`) AS mn, MAX(`Reporting_Date`) AS mx FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular'

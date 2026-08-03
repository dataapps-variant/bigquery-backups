-- job_id: 7ba13679-3994-4c3b-bb5d-f88f8e640b86
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T13:04:14.953000+00:00
-- started: 2026-07-31T13:04:15.083000+00:00
-- ended: 2026-07-31T13:04:15.225000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

-- job_id: 1aa5a631-05fa-4843-801b-caf73594c4d9
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:35:35.582000+00:00
-- started: 2026-07-30T13:35:35.705000+00:00
-- ended: 2026-07-30T13:35:35.863000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

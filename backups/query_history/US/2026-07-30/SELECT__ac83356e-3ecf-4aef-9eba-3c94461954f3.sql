-- job_id: ac83356e-3ecf-4aef-9eba-3c94461954f3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:52:22.773000+00:00
-- started: 2026-07-30T13:52:22.905000+00:00
-- ended: 2026-07-30T13:52:23.036000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

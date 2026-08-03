-- job_id: b00b3b58-c85e-48c4-a456-103f02ad064c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:45:24.163000+00:00
-- started: 2026-07-29T11:45:24.274000+00:00
-- ended: 2026-07-29T11:45:24.409000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

-- job_id: 8d63722c-6fe1-45b8-b523-d5db1659a9ad
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:36:19.992000+00:00
-- started: 2026-07-29T11:36:20.092000+00:00
-- ended: 2026-07-29T11:36:20.294000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

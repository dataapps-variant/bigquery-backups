-- job_id: 579b3701-8a4d-4767-8dde-1f7801c80229
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:48:38.397000+00:00
-- started: 2026-07-30T12:48:38.476000+00:00
-- ended: 2026-07-30T12:48:38.670000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

-- job_id: 5ed6b278-c2f7-4cc6-8c07-d0367e10c526
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T12:50:21.291000+00:00
-- started: 2026-08-03T12:50:21.571000+00:00
-- ended: 2026-08-03T12:50:21.812000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

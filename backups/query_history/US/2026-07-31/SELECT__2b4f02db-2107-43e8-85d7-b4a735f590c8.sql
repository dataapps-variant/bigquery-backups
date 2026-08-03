-- job_id: 2b4f02db-2107-43e8-85d7-b4a735f590c8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:21.061000+00:00
-- started: 2026-07-31T10:51:21.135000+00:00
-- ended: 2026-07-31T10:51:21.340000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

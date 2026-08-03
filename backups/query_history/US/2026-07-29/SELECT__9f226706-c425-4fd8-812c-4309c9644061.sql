-- job_id: 9f226706-c425-4fd8-812c-4309c9644061
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:47:53.390000+00:00
-- started: 2026-07-29T11:47:53.487000+00:00
-- ended: 2026-07-29T11:47:53.616000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

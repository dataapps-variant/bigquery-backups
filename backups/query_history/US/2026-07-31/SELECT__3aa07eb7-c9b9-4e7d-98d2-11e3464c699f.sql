-- job_id: 3aa07eb7-c9b9-4e7d-98d2-11e3464c699f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:11:57.749000+00:00
-- started: 2026-07-31T09:11:57.848000+00:00
-- ended: 2026-07-31T09:11:58.026000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

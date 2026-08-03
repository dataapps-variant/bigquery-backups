-- job_id: ba5f3307-d309-4585-b086-5814582b5056
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:14:47.492000+00:00
-- started: 2026-07-29T11:14:47.587000+00:00
-- ended: 2026-07-29T11:14:47.824000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

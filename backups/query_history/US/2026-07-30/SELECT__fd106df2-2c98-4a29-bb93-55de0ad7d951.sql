-- job_id: fd106df2-2c98-4a29-bb93-55de0ad7d951
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T17:32:29.713000+00:00
-- started: 2026-07-30T17:32:29.942000+00:00
-- ended: 2026-07-30T17:32:30.163000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

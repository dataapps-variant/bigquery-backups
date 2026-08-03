-- job_id: 11a2cec4-5121-4de0-915b-ce03470250f2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:03:32.349000+00:00
-- started: 2026-07-28T13:03:32.442000+00:00
-- ended: 2026-07-28T13:03:32.649000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c

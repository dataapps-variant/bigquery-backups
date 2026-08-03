-- job_id: job_KGXDc4NJtSLGPuD65hWbcWCUfoAl
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:59.926000+00:00
-- started: 2026-08-03T05:46:00.213000+00:00
-- ended: 2026-08-03T05:46:01.170000+00:00

DELETE FROM `TikTok_DT_Ads` WHERE `TikTok_DT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Ads_d0a25fd2_6313_4e58_99e3_2583009b6694` AS main_table_alias)

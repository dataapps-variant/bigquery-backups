-- job_id: job_bGUsoZQ7-kAWcEPcvemA-jH6z3zi
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:03.043000+00:00
-- started: 2026-07-30T05:46:03.342000+00:00
-- ended: 2026-07-30T05:46:04.401000+00:00

DELETE FROM `TikTok_DT_Ads` WHERE `TikTok_DT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Ads_36a61c25_537d_492d_a8cf_6979b51b6290` AS main_table_alias)

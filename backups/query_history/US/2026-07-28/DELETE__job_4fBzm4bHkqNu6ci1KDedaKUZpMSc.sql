-- job_id: job_4fBzm4bHkqNu6ci1KDedaKUZpMSc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:17.914000+00:00
-- started: 2026-07-28T05:46:18.229000+00:00
-- ended: 2026-07-28T05:46:19.270000+00:00

DELETE FROM `TikTok_DT_Ads` WHERE `TikTok_DT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Ads_6199a41d_8352_42e7_822e_960899c88488` AS main_table_alias)

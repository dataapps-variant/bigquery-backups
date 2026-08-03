-- job_id: job_lSAnUljcZp8bOfz8g-1Ul8vhHUan
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:10.728000+00:00
-- started: 2026-07-29T05:46:10.999000+00:00
-- ended: 2026-07-29T05:46:12.012000+00:00

DELETE FROM `TikTok_DT_Campaigns` WHERE `TikTok_DT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Campaigns_129c23b3_86f7_4563_9f48_369cfa87e5b2` AS main_table_alias)

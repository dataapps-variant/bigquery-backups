-- job_id: job_4HZlFKYtB2QbMPQH3RpszTjpN8fY
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:23.156000+00:00
-- started: 2026-07-29T05:46:23.446000+00:00
-- ended: 2026-07-29T05:46:24.364000+00:00

DELETE FROM `TikTok_JF_Ads` WHERE `TikTok_JF_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Ads_a5939a58_e762_4d25_b2e1_a48884db2c64` AS main_table_alias)

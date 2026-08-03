-- job_id: job_AoPLL1kK-0a-6zftEKrYBG2GlalX
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:59.370000+00:00
-- started: 2026-08-03T05:45:59.936000+00:00
-- ended: 2026-08-03T05:46:01.667000+00:00

DELETE FROM `TikTok_CT_Campaigns` WHERE `TikTok_CT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Campaigns_5fdcbc26_b853_413e_8596_ac6c7c26306c` AS main_table_alias)

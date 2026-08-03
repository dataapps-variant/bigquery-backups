-- job_id: job_aJ_ZwVIiHt2hpiCanZ8_nAKkQoSB
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:02.898000+00:00
-- started: 2026-07-30T05:46:03.337000+00:00
-- ended: 2026-07-30T05:46:04.398000+00:00

DELETE FROM `TikTok_DT_AdGroups` WHERE `TikTok_DT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_AdGroups_dab591a2_c53d_420d_8296_96fc70d81e8d` AS main_table_alias)

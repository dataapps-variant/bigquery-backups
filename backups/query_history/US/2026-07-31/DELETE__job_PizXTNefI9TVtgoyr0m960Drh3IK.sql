-- job_id: job_PizXTNefI9TVtgoyr0m960Drh3IK
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:10.844000+00:00
-- started: 2026-07-31T05:46:11.177000+00:00
-- ended: 2026-07-31T05:46:12.112000+00:00

DELETE FROM `TikTok_JF_AdGroups` WHERE `TikTok_JF_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_AdGroups_a5311857_f76b_4ad0_9063_4a4db3ad66fe` AS main_table_alias)

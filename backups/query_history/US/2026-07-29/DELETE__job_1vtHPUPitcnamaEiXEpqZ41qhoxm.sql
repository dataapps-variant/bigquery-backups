-- job_id: job_1vtHPUPitcnamaEiXEpqZ41qhoxm
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:08.867000+00:00
-- started: 2026-07-29T05:46:09.158000+00:00
-- ended: 2026-07-29T05:46:10.201000+00:00

DELETE FROM `TikTok_JF_AdGroups` WHERE `TikTok_JF_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_AdGroups_7c10c47f_4207_4c19_8db9_c2d30293fcef` AS main_table_alias)

-- job_id: job_VU3L63f4seEF5RNsEn9V_x_USuGh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:07.436000+00:00
-- started: 2026-08-02T05:46:07.751000+00:00
-- ended: 2026-08-02T05:46:08.651000+00:00

DELETE FROM `TikTok_JF_AdGroups` WHERE `TikTok_JF_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_AdGroups_bd37c894_f5ed_41a0_8562_f4013c7b7e43` AS main_table_alias)

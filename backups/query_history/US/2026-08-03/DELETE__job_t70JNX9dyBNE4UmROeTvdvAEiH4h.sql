-- job_id: job_t70JNX9dyBNE4UmROeTvdvAEiH4h
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:04.339000+00:00
-- started: 2026-08-03T05:46:04.875000+00:00
-- ended: 2026-08-03T05:46:05.797000+00:00

DELETE FROM `TikTok_JF_AdGroups` WHERE `TikTok_JF_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_AdGroups_afe2e8da_10e9_4f5e_b386_8b39a3e920ac` AS main_table_alias)

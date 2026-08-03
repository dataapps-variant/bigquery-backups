-- job_id: job_tGmEoZkDA-a0JTm2-LNWtr_TL7gF
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:08.621000+00:00
-- started: 2026-07-30T05:46:08.927000+00:00
-- ended: 2026-07-30T05:46:10.023000+00:00

DELETE FROM `TikTok_JF_AdGroups` WHERE `TikTok_JF_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_AdGroups_b32a2b97_677a_4c17_b8d0_4ba0810d63aa` AS main_table_alias)

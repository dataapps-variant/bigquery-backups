-- job_id: job_XEkhzmF_tV4EckgNYkpM9V0qknmB
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:08.960000+00:00
-- started: 2026-07-29T05:46:09.259000+00:00
-- ended: 2026-07-29T05:46:18.311000+00:00

DELETE FROM `TikTok_CT_AdGroups` WHERE `TikTok_CT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_AdGroups_4c6a853f_9c5b_4b9a_85f5_2c1177ff6390` AS main_table_alias)

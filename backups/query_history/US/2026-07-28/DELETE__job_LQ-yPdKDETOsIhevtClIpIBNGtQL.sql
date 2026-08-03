-- job_id: job_LQ-yPdKDETOsIhevtClIpIBNGtQL
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:16.065000+00:00
-- started: 2026-07-28T05:46:16.342000+00:00
-- ended: 2026-07-28T05:46:17.392000+00:00

DELETE FROM `TikTok_JF_AdGroups` WHERE `TikTok_JF_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_AdGroups_0dae2e25_6534_4b9b_965a_b494a8fb5542` AS main_table_alias)

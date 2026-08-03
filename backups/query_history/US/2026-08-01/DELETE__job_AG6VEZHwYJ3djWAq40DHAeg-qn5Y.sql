-- job_id: job_AG6VEZHwYJ3djWAq40DHAeg-qn5Y
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:11.805000+00:00
-- started: 2026-08-01T05:46:12.118000+00:00
-- ended: 2026-08-01T05:46:13.822000+00:00

DELETE FROM `TikTok_JF_AdGroups` WHERE `TikTok_JF_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_AdGroups_64079e33_6563_4e74_802f_285547573391` AS main_table_alias)

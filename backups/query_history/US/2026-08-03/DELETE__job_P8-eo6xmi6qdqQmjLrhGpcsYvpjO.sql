-- job_id: job_P8-eo6xmi6qdqQmjLrhGpcsYvpjO
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:06.701000+00:00
-- started: 2026-08-03T05:46:07.034000+00:00
-- ended: 2026-08-03T05:46:08.224000+00:00

DELETE FROM `TikTok_DT_AdGroups` WHERE `TikTok_DT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_AdGroups_0b299034_24bd_4470_9a3f_3cc33e02401c` AS main_table_alias)

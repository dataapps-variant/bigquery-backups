-- job_id: job_a0qfLw1iUCMUdJ0fonL9CMY8OlNS
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:11.308000+00:00
-- started: 2026-07-29T05:46:11.612000+00:00
-- ended: 2026-07-29T05:46:31.025000+00:00

DELETE FROM `TikTok_DT_AdGroups` WHERE `TikTok_DT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_AdGroups_186e200f_8483_4aeb_b15f_af3a8aae54a4` AS main_table_alias)

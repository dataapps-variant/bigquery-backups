-- job_id: job_SZtFuD1HJt9T9Mz4UfELyQpIU5Lt
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:14.443000+00:00
-- started: 2026-07-28T05:46:14.709000+00:00
-- ended: 2026-07-28T05:46:15.776000+00:00

DELETE FROM `TikTok_JF_Campaigns` WHERE `TikTok_JF_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Campaigns_7a974612_f01a_4ebb_8c99_f8873e558842` AS main_table_alias)

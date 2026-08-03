-- job_id: job_vWYeR7myhN7YVqPXyeQx2LVWaqXS
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:17.846000+00:00
-- started: 2026-07-28T05:46:18.099000+00:00
-- ended: 2026-07-28T05:46:19.155000+00:00

DELETE FROM `TikTok_DT_Campaigns` WHERE `TikTok_DT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Campaigns_183de3cb_7edd_46d4_b634_1aea958af451` AS main_table_alias)

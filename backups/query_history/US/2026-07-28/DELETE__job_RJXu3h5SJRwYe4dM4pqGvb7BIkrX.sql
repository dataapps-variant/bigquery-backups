-- job_id: job_RJXu3h5SJRwYe4dM4pqGvb7BIkrX
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:17.827000+00:00
-- started: 2026-07-28T05:46:18.106000+00:00
-- ended: 2026-07-28T05:46:19.079000+00:00

DELETE FROM `TikTok_DT_AdGroups` WHERE `TikTok_DT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_AdGroups_216c94bc_ebf2_430d_b479_b82e352dda0d` AS main_table_alias)

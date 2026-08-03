-- job_id: job_gQOdw1cFYNvocNfVrjRW1QlgqER3
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:02.643000+00:00
-- started: 2026-08-01T05:46:02.929000+00:00
-- ended: 2026-08-01T05:46:03.931000+00:00

DELETE FROM `TikTok_DT_Campaigns` WHERE `TikTok_DT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Campaigns_bb3b9450_75c8_48f5_9d89_4462bab02a13` AS main_table_alias)

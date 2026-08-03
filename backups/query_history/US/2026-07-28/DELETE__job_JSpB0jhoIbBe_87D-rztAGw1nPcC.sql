-- job_id: job_JSpB0jhoIbBe_87D-rztAGw1nPcC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:16.002000+00:00
-- started: 2026-07-28T05:46:16.849000+00:00
-- ended: 2026-07-28T05:46:17.970000+00:00

DELETE FROM `TikTok_CT_Campaigns` WHERE `TikTok_CT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Campaigns_1262b6ae_ed2f_4a45_95bb_520e9a6cdfe2` AS main_table_alias)

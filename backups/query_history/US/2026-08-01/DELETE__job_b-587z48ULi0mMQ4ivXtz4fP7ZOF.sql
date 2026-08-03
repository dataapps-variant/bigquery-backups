-- job_id: job_b-587z48ULi0mMQ4ivXtz4fP7ZOF
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:05.486000+00:00
-- started: 2026-08-01T05:46:05.829000+00:00
-- ended: 2026-08-01T05:46:06.832000+00:00

DELETE FROM `TikTok_JF_Campaigns` WHERE `TikTok_JF_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Campaigns_bd155b7f_ff91_4c59_96ad_f2191da44c6d` AS main_table_alias)

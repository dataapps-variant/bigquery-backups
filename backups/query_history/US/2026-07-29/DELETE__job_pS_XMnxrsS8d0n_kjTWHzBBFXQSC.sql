-- job_id: job_pS_XMnxrsS8d0n_kjTWHzBBFXQSC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:09.101000+00:00
-- started: 2026-07-29T05:46:09.438000+00:00
-- ended: 2026-07-29T05:46:10.573000+00:00

DELETE FROM `TikTok_CT_Ads` WHERE `TikTok_CT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Ads_a4a6c935_8f5f_4c57_9322_0a721bdc7814` AS main_table_alias)

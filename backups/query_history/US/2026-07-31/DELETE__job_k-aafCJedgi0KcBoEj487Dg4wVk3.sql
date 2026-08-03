-- job_id: job_k-aafCJedgi0KcBoEj487Dg4wVk3
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:08.369000+00:00
-- started: 2026-07-31T05:46:08.691000+00:00
-- ended: 2026-07-31T05:46:09.758000+00:00

DELETE FROM `TikTok_DT_Ads` WHERE `TikTok_DT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Ads_d9b15538_905f_4413_b3ae_68cda4c68030` AS main_table_alias)

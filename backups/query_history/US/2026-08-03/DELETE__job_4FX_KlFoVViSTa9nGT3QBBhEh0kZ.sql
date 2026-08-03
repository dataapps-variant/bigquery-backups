-- job_id: job_4FX_KlFoVViSTa9nGT3QBBhEh0kZ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:59.921000+00:00
-- started: 2026-08-03T05:46:00.264000+00:00
-- ended: 2026-08-03T05:46:06.072000+00:00

DELETE FROM `TikTok_CT_AdGroups` WHERE `TikTok_CT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_AdGroups_2d8107aa_09ae_4cbd_b217_d632482d4090` AS main_table_alias)

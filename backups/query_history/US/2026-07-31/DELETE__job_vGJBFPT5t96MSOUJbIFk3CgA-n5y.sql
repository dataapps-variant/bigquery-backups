-- job_id: job_vGJBFPT5t96MSOUJbIFk3CgA-n5y
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:04.464000+00:00
-- started: 2026-07-31T05:46:04.803000+00:00
-- ended: 2026-07-31T05:46:05.799000+00:00

DELETE FROM `TikTok_CT_Campaigns` WHERE `TikTok_CT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Campaigns_4d69a8db_e88b_47a3_87dc_1d6acdcc37a9` AS main_table_alias)

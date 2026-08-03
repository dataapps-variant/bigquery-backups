-- job_id: job_rK4RRLqHrkikcIxwH6Ok2untgbZI
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:05.742000+00:00
-- started: 2026-07-31T05:46:06.079000+00:00
-- ended: 2026-07-31T05:46:07.018000+00:00

DELETE FROM `TikTok_CT_AdGroups` WHERE `TikTok_CT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_AdGroups_0364aa25_221e_4c24_8684_7060f91da592` AS main_table_alias)

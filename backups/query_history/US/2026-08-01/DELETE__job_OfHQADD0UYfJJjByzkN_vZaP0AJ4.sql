-- job_id: job_OfHQADD0UYfJJjByzkN_vZaP0AJ4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:08.341000+00:00
-- started: 2026-08-01T05:46:08.583000+00:00
-- ended: 2026-08-01T05:46:09.585000+00:00

DELETE FROM `TikTok_CT_AdGroups` WHERE `TikTok_CT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_AdGroups_049da5e9_72d3_4fec_9c4a_4eaadd80b005` AS main_table_alias)

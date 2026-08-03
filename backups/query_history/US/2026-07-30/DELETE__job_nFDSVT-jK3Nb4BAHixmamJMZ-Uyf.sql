-- job_id: job_nFDSVT-jK3Nb4BAHixmamJMZ-Uyf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:05.429000+00:00
-- started: 2026-07-30T05:46:05.760000+00:00
-- ended: 2026-07-30T05:46:06.893000+00:00

DELETE FROM `TikTok_CT_AdGroups` WHERE `TikTok_CT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_AdGroups_df1224a2_96e6_436c_8018_4be96b27bf83` AS main_table_alias)

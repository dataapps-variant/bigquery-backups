-- job_id: job_vpcsIEmYCdsFrirfr1OWvu4dkio_
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:06.508000+00:00
-- started: 2026-07-31T05:46:06.871000+00:00
-- ended: 2026-07-31T05:46:07.883000+00:00

DELETE FROM `TikTok_DT_AdGroups` WHERE `TikTok_DT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_AdGroups_88c8c593_e07c_437a_b916_2804446a49c3` AS main_table_alias)

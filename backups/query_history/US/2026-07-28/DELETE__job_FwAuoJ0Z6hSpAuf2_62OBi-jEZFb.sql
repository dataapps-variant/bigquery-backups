-- job_id: job_FwAuoJ0Z6hSpAuf2_62OBi-jEZFb
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:16.373000+00:00
-- started: 2026-07-28T05:46:16.733000+00:00
-- ended: 2026-07-28T05:46:17.813000+00:00

DELETE FROM `TikTok_CT_AdGroups` WHERE `TikTok_CT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_AdGroups_e1d7e001_fff6_48de_a165_bb8905da907d` AS main_table_alias)

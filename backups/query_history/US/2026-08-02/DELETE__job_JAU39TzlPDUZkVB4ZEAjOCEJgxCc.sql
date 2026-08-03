-- job_id: job_JAU39TzlPDUZkVB4ZEAjOCEJgxCc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:01.940000+00:00
-- started: 2026-08-02T05:46:02.259000+00:00
-- ended: 2026-08-02T05:46:03.222000+00:00

DELETE FROM `TikTok_DT_AdGroups` WHERE `TikTok_DT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_AdGroups_bbeb3c98_7959_4d50_bdee_e70ee385288b` AS main_table_alias)

-- job_id: job_mtJmtB2ajThIBZ00JuFInrve8vAu
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:02.175000+00:00
-- started: 2026-08-02T05:46:02.479000+00:00
-- ended: 2026-08-02T05:46:03.556000+00:00

DELETE FROM `TikTok_CT_AdGroups` WHERE `TikTok_CT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_AdGroups_cf486d98_933c_484e_b402_edc1b8a27777` AS main_table_alias)

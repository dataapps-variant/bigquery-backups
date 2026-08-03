-- job_id: job_XJTOng8D5GSFRXcnDwCEFiQjo2Fn
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:01.799000+00:00
-- started: 2026-08-02T05:46:02.380000+00:00
-- ended: 2026-08-02T05:46:03.300000+00:00

DELETE FROM `TikTok_DT_Campaigns` WHERE `TikTok_DT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Campaigns_f0e50ca3_8d4c_402c_9907_9881ec18a6f9` AS main_table_alias)

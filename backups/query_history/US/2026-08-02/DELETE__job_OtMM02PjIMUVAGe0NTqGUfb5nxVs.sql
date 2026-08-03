-- job_id: job_OtMM02PjIMUVAGe0NTqGUfb5nxVs
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:02.218000+00:00
-- started: 2026-08-02T05:46:02.545000+00:00
-- ended: 2026-08-02T05:46:03.586000+00:00

DELETE FROM `TikTok_CT_Campaigns` WHERE `TikTok_CT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Campaigns_dee31978_fba2_4f82_92b8_02e93963da4d` AS main_table_alias)

-- job_id: job_XR8mEEpDq2sQt1sB_204sRVtEQqT
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:04.379000+00:00
-- started: 2026-08-01T05:46:04.776000+00:00
-- ended: 2026-08-01T05:46:05.975000+00:00

DELETE FROM `TikTok_CT_Campaigns` WHERE `TikTok_CT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Campaigns_eb485262_35f5_468b_ba2d_e6e9a93c5803` AS main_table_alias)

-- job_id: job_g_C0ytMT20hT46cmKpyUZsD_GyrI
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:00.502000+00:00
-- started: 2026-08-03T05:46:00.880000+00:00
-- ended: 2026-08-03T05:46:02.203000+00:00

DELETE FROM `TikTok_JF_Campaigns` WHERE `TikTok_JF_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Campaigns_ac2f4dd6_b8b7_4b95_b599_ff8ad83de861` AS main_table_alias)

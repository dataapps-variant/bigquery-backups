-- job_id: job_rllFRpDiL4iniqO6B1hRkH9nT9xC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:00.041000+00:00
-- started: 2026-08-03T05:46:00.312000+00:00
-- ended: 2026-08-03T05:46:01.518000+00:00

DELETE FROM `TikTok_CT_Ads` WHERE `TikTok_CT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Ads_2153c161_dbc2_4a38_966b_24fa1fa8465b` AS main_table_alias)

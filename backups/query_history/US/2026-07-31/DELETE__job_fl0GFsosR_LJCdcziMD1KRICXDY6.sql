-- job_id: job_fl0GFsosR_LJCdcziMD1KRICXDY6
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:05.372000+00:00
-- started: 2026-07-31T05:46:05.679000+00:00
-- ended: 2026-07-31T05:46:06.638000+00:00

DELETE FROM `TikTok_CT_Ads` WHERE `TikTok_CT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Ads_7b79390d_e85c_48f9_b181_faf2796e32fd` AS main_table_alias)

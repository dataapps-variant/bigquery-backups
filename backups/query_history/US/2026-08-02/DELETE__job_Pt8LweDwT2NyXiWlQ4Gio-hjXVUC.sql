-- job_id: job_Pt8LweDwT2NyXiWlQ4Gio-hjXVUC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:13.246000+00:00
-- started: 2026-08-02T05:46:13.505000+00:00
-- ended: 2026-08-02T05:46:14.480000+00:00

DELETE FROM `TikTok_JF_Ads` WHERE `TikTok_JF_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Ads_e6da43f1_bf54_4b8c_8808_af54a30ad0ee` AS main_table_alias)

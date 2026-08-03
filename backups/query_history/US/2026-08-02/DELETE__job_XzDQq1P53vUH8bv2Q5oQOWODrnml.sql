-- job_id: job_XzDQq1P53vUH8bv2Q5oQOWODrnml
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:02.745000+00:00
-- started: 2026-08-02T05:46:03.024000+00:00
-- ended: 2026-08-02T05:46:03.876000+00:00

DELETE FROM `TikTok_DT_Ads` WHERE `TikTok_DT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Ads_6494289c_05ed_4807_a3cb_d9bed2438188` AS main_table_alias)

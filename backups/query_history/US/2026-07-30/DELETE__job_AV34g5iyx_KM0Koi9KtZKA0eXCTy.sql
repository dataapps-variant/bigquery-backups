-- job_id: job_AV34g5iyx_KM0Koi9KtZKA0eXCTy
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:04.137000+00:00
-- started: 2026-07-30T05:46:04.508000+00:00
-- ended: 2026-07-30T05:46:05.479000+00:00

DELETE FROM `TikTok_DT_Campaigns` WHERE `TikTok_DT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Campaigns_3c1e9d3b_9964_4e9b_8f7c_784b567e4a81` AS main_table_alias)

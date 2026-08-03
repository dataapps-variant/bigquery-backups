-- job_id: job_MRxPRgZjm8KOM_xDGAbl6IMxeru8
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:11.675000+00:00
-- started: 2026-07-29T05:46:11.982000+00:00
-- ended: 2026-07-29T05:46:12.988000+00:00

DELETE FROM `TikTok_DT_Ads` WHERE `TikTok_DT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Ads_ea1e902e_7e9b_4aa3_a880_31597a9552bc` AS main_table_alias)

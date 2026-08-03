-- job_id: job_0ZyC3W41EtMxXd8j13nStZl5NGgQ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:17.678000+00:00
-- started: 2026-07-28T05:46:17.950000+00:00
-- ended: 2026-07-28T05:46:18.928000+00:00

DELETE FROM `TikTok_JF_Ads` WHERE `TikTok_JF_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Ads_a9a1537b_22bd_4b59_a6d5_169630fcbbba` AS main_table_alias)

-- job_id: job_QHLeg_APg-OgSciwCJO-sXlxcvQw
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:08.395000+00:00
-- started: 2026-07-29T05:46:08.741000+00:00
-- ended: 2026-07-29T05:46:09.716000+00:00

DELETE FROM `TikTok_JF_Campaigns` WHERE `TikTok_JF_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Campaigns_f5a853ab_66c4_4886_a4d0_66a8308059ad` AS main_table_alias)

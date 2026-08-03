-- job_id: job_pJDBvu0lKFV1h7ZSLgiMKix0H9GY
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:03.254000+00:00
-- started: 2026-08-01T05:46:03.571000+00:00
-- ended: 2026-08-01T05:46:04.652000+00:00

DELETE FROM `TikTok_DT_Ads` WHERE `TikTok_DT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Ads_d8398c35_b413_4210_b878_01d73dcc8ee3` AS main_table_alias)

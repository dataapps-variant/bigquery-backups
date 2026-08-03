-- job_id: job_GsRXXPDbReEpLmvNlshRaHqo7BD2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:16.311000+00:00
-- started: 2026-07-28T05:46:16.620000+00:00
-- ended: 2026-07-28T05:46:17.821000+00:00

DELETE FROM `TikTok_CT_Ads` WHERE `TikTok_CT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Ads_19273d39_3776_450f_87f4_4f27db8a1364` AS main_table_alias)

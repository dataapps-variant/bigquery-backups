-- job_id: job_U20uk0C9RNXrKQBbiXauf6XFSJF1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:12.764000+00:00
-- started: 2026-08-01T05:46:13.039000+00:00
-- ended: 2026-08-01T05:46:14.064000+00:00

DELETE FROM `TikTok_JF_Ads` WHERE `TikTok_JF_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Ads_c3893684_87f8_46ba_80c3_336772848ce2` AS main_table_alias)

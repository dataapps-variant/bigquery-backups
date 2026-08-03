-- job_id: job_svggpDLqjUEbHrN5US6miVDZD0G2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:06.686000+00:00
-- started: 2026-07-30T05:46:07.013000+00:00
-- ended: 2026-07-30T05:46:08.269000+00:00

DELETE FROM `TikTok_CT_Ads` WHERE `TikTok_CT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Ads_f4c1ff83_00ec_4e53_9136_ec292d0cdc2b` AS main_table_alias)

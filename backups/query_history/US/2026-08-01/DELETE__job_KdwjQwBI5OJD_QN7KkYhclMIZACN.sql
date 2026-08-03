-- job_id: job_KdwjQwBI5OJD_QN7KkYhclMIZACN
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:04.956000+00:00
-- started: 2026-08-01T05:46:05.272000+00:00
-- ended: 2026-08-01T05:46:06.252000+00:00

DELETE FROM `TikTok_CT_Ads` WHERE `TikTok_CT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Ads_b5a0de15_2873_4f0f_831c_0cc292cda80b` AS main_table_alias)

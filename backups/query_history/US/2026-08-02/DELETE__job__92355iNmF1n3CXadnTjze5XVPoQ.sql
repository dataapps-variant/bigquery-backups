-- job_id: job__92355iNmF1n3CXadnTjze5XVPoQ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:03.161000+00:00
-- started: 2026-08-02T05:46:03.450000+00:00
-- ended: 2026-08-02T05:46:04.394000+00:00

DELETE FROM `TikTok_CT_Ads` WHERE `TikTok_CT_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Ads_7c02c467_043b_4f19_b247_0fe9f4630712` AS main_table_alias)

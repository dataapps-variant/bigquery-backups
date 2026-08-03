-- job_id: job_eKE2hNPDgWm2X7TLWzp5KVtsXktc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:11.388000+00:00
-- started: 2026-07-30T05:46:11.652000+00:00
-- ended: 2026-07-30T05:46:12.732000+00:00

DELETE FROM `TikTok_JF_Ads` WHERE `TikTok_JF_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Ads_56417894_8ed7_4613_bc8c_bcc8fc113ad6` AS main_table_alias)

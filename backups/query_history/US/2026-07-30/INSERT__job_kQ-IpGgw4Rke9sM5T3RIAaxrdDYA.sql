-- job_id: job_kQ-IpGgw4Rke9sM5T3RIAaxrdDYA
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:11.138000+00:00
-- started: 2026-07-30T05:46:11.338000+00:00
-- ended: 2026-07-30T05:46:12.210000+00:00

INSERT INTO `TikTok_JF_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdsDailyReport_3a44f183_92c4_4dc4_80e7_d6529afbfa9c` AS main_table_alias)

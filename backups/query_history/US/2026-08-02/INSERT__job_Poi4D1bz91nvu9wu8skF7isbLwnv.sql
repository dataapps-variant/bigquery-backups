-- job_id: job_Poi4D1bz91nvu9wu8skF7isbLwnv
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:09.615000+00:00
-- started: 2026-08-02T05:46:09.818000+00:00
-- ended: 2026-08-02T05:46:10.661000+00:00

INSERT INTO `TikTok_JF_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdsDailyReport_51536e6a_5251_4e19_9201_65e52ccc0730` AS main_table_alias)

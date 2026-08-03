-- job_id: job_jtwhq-ZmrV47FZtGTifSbUcxbVRE
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:07.264000+00:00
-- started: 2026-08-02T05:46:07.413000+00:00
-- ended: 2026-08-02T05:46:08.101000+00:00

INSERT INTO `MS_Ads_EN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_EN_GeographicPerformanceDailyReport_06d6ea44_4975_4af9_be47_99760fca5eb6` AS main_table_alias)

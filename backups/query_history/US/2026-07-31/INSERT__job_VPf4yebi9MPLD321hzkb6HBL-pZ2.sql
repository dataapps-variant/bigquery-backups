-- job_id: job_VPf4yebi9MPLD321hzkb6HBL-pZ2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:06.730000+00:00
-- started: 2026-07-31T05:46:06.900000+00:00
-- ended: 2026-07-31T05:46:07.700000+00:00

INSERT INTO `MS_Ads_JF_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_JF_GeographicPerformanceDailyReport_88f77966_0a4c_4c15_b956_092cf3171551` AS main_table_alias)

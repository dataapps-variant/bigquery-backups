-- job_id: job_DA11j_rkEoEaTGNadrA_WvztQdr8
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:39.527000+00:00
-- started: 2026-07-29T05:46:39.744000+00:00
-- ended: 2026-07-29T05:46:44.498000+00:00

INSERT INTO `Facebook_Clicks_JF_DailyAdInsights` (`DateStart`, `ReportTime`, `AdId`, `AdName`, `AdSetId`, `AdSetName`, `CampaignId`, `CampaignName`, `AccountCurrency`, `AccountId`, `AccountName`, `Clicks`, `CostPerAdClick`, `CostPerUniqueClick`, `FullViewImpressions`, `Impressions`, `Reach`, `Spend`, `Country`, `LandingDestination`, `LinkUrlAsset`, `MediaAassetUrl`, `MediaDestinationUrl`, `MediaOriginUrl`, `Region`) (SELECT main_table_alias.`DateStart`,main_table_alias.`ReportTime`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`AdSetId`,main_table_alias.`AdSetName`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AccountCurrency`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`Clicks`,main_table_alias.`CostPerAdClick`,main_table_alias.`CostPerUniqueClick`,main_table_alias.`FullViewImpressions`,main_table_alias.`Impressions`,main_table_alias.`Reach`,main_table_alias.`Spend`,main_table_alias.`Country`,main_table_alias.`LandingDestination`,main_table_alias.`LinkUrlAsset`,main_table_alias.`MediaAassetUrl`,main_table_alias.`MediaDestinationUrl`,main_table_alias.`MediaOriginUrl`,main_table_alias.`Region`  FROM `Facebook_Clicks_JF_DailyAdInsights_512519b4_9f22_4c75_94aa_92c82ea0ce4a` AS main_table_alias)

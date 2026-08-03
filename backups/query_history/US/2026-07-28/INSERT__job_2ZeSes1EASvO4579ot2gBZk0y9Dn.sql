-- job_id: job_2ZeSes1EASvO4579ot2gBZk0y9Dn
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:46.340000+00:00
-- started: 2026-07-28T05:46:46.512000+00:00
-- ended: 2026-07-28T05:46:47.544000+00:00

INSERT INTO `Facebook_Clicks_JF_DailyAdInsights` (`DateStart`, `ReportTime`, `AdId`, `AdName`, `AdSetId`, `AdSetName`, `CampaignId`, `CampaignName`, `AccountCurrency`, `AccountId`, `AccountName`, `Clicks`, `CostPerAdClick`, `CostPerUniqueClick`, `FullViewImpressions`, `Impressions`, `Reach`, `Spend`, `Country`, `LandingDestination`, `LinkUrlAsset`, `MediaAassetUrl`, `MediaDestinationUrl`, `MediaOriginUrl`, `Region`) (SELECT main_table_alias.`DateStart`,main_table_alias.`ReportTime`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`AdSetId`,main_table_alias.`AdSetName`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AccountCurrency`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`Clicks`,main_table_alias.`CostPerAdClick`,main_table_alias.`CostPerUniqueClick`,main_table_alias.`FullViewImpressions`,main_table_alias.`Impressions`,main_table_alias.`Reach`,main_table_alias.`Spend`,main_table_alias.`Country`,main_table_alias.`LandingDestination`,main_table_alias.`LinkUrlAsset`,main_table_alias.`MediaAassetUrl`,main_table_alias.`MediaDestinationUrl`,main_table_alias.`MediaOriginUrl`,main_table_alias.`Region`  FROM `Facebook_Clicks_JF_DailyAdInsights_7455733c_57ac_4607_aacf_ee3802f5a382` AS main_table_alias)

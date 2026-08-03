-- job_id: job_cOQQH30O0ybupyCHKWQRORZv4CrD
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:39.515000+00:00
-- started: 2026-08-01T05:46:39.690000+00:00
-- ended: 2026-08-01T05:46:40.487000+00:00

INSERT INTO `Facebook_Clicks_JF_DailyAdInsights` (`DateStart`, `ReportTime`, `AdId`, `AdName`, `AdSetId`, `AdSetName`, `CampaignId`, `CampaignName`, `AccountCurrency`, `AccountId`, `AccountName`, `Clicks`, `CostPerAdClick`, `CostPerUniqueClick`, `FullViewImpressions`, `Impressions`, `Reach`, `Spend`, `Country`, `LandingDestination`, `LinkUrlAsset`, `MediaAassetUrl`, `MediaDestinationUrl`, `MediaOriginUrl`, `Region`) (SELECT main_table_alias.`DateStart`,main_table_alias.`ReportTime`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`AdSetId`,main_table_alias.`AdSetName`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AccountCurrency`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`Clicks`,main_table_alias.`CostPerAdClick`,main_table_alias.`CostPerUniqueClick`,main_table_alias.`FullViewImpressions`,main_table_alias.`Impressions`,main_table_alias.`Reach`,main_table_alias.`Spend`,main_table_alias.`Country`,main_table_alias.`LandingDestination`,main_table_alias.`LinkUrlAsset`,main_table_alias.`MediaAassetUrl`,main_table_alias.`MediaDestinationUrl`,main_table_alias.`MediaOriginUrl`,main_table_alias.`Region`  FROM `Facebook_Clicks_JF_DailyAdInsights_e7d25527_3b3d_481e_9eb2_ffae87ffcd87` AS main_table_alias)

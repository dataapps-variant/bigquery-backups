-- job_id: job_LOY_IGINupT0mcpBMMZjM9Uye6Gn
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:47:34.764000+00:00
-- started: 2026-08-02T05:47:34.951000+00:00
-- ended: 2026-08-02T05:47:35.979000+00:00

INSERT INTO `Facebook_Ads_JF_DailyAdInsights` (`DateStart`, `ReportTime`, `AdId`, `AdName`, `AdSetId`, `AdSetName`, `CampaignId`, `CampaignName`, `AccountCurrency`, `AccountId`, `AccountName`, `Spend`, `Country`, `LandingDestination`, `LinkUrlAsset`, `MediaAassetUrl`, `MediaDestinationUrl`, `MediaOriginUrl`, `Region`) (SELECT main_table_alias.`DateStart`,main_table_alias.`ReportTime`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`AdSetId`,main_table_alias.`AdSetName`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AccountCurrency`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`Spend`,main_table_alias.`Country`,main_table_alias.`LandingDestination`,main_table_alias.`LinkUrlAsset`,main_table_alias.`MediaAassetUrl`,main_table_alias.`MediaDestinationUrl`,main_table_alias.`MediaOriginUrl`,main_table_alias.`Region`  FROM `Facebook_Ads_JF_DailyAdInsights_b93b0619_8d9e_41f9_9c9c_6571d6db4ae0` AS main_table_alias)

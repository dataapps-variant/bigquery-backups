-- job_id: job_LqOz6qzVavQOL98Ta1oy4kLrI_o3
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:09.463000+00:00
-- started: 2026-07-30T05:46:09.635000+00:00
-- ended: 2026-07-30T05:46:10.476000+00:00

INSERT INTO `TikTok_JF_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Ads_85bdba4f_985f_49f6_a9af_0f17104abd59` AS main_table_alias LEFT JOIN `TikTok_JF_Ads` ON main_table_alias.`Id` = `TikTok_JF_Ads`.`Id` WHERE `TikTok_JF_Ads`.`Id` IS NULL)

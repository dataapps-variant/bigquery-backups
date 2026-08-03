-- job_id: job_M7C28ToCoHo1Kj9FW4-sv2HKKU0k
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:04.474000+00:00
-- started: 2026-07-30T05:46:04.675000+00:00
-- ended: 2026-07-30T05:46:05.520000+00:00

INSERT INTO `TikTok_CT_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_Ads_9973bf76_e233_44c6_ab22_90f8c6d07544` AS main_table_alias LEFT JOIN `TikTok_CT_Ads` ON main_table_alias.`Id` = `TikTok_CT_Ads`.`Id` WHERE `TikTok_CT_Ads`.`Id` IS NULL)

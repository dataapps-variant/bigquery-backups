-- job_id: job_wwxN6L8BrCAMObN6yMMbbXMbMjDU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:15.596000+00:00
-- started: 2026-07-28T05:46:15.837000+00:00
-- ended: 2026-07-28T05:46:16.800000+00:00

INSERT INTO `TikTok_JF_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Ads_226f74d9_da89_478c_9aa6_b4de5f4c6e9f` AS main_table_alias LEFT JOIN `TikTok_JF_Ads` ON main_table_alias.`Id` = `TikTok_JF_Ads`.`Id` WHERE `TikTok_JF_Ads`.`Id` IS NULL)

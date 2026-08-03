-- job_id: job_ZqAKSjha88IhoWQl-nhDh9SkDn4c
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:02.909000+00:00
-- started: 2026-08-01T05:46:03.060000+00:00
-- ended: 2026-08-01T05:46:03.940000+00:00

INSERT INTO `TikTok_CT_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_Ads_391c6cb4_3fe4_4d2e_8af4_2f71b0ea42d5` AS main_table_alias LEFT JOIN `TikTok_CT_Ads` ON main_table_alias.`Id` = `TikTok_CT_Ads`.`Id` WHERE `TikTok_CT_Ads`.`Id` IS NULL)

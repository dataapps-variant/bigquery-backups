-- job_id: job_Cb_96XmRk7qViTNlk8KKHw3Ng22h
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:09.312000+00:00
-- started: 2026-07-29T05:46:09.550000+00:00
-- ended: 2026-07-29T05:46:10.644000+00:00

INSERT INTO `TikTok_DT_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_Ads_24709ab5_0718_497e_b96c_35e426179483` AS main_table_alias LEFT JOIN `TikTok_DT_Ads` ON main_table_alias.`Id` = `TikTok_DT_Ads`.`Id` WHERE `TikTok_DT_Ads`.`Id` IS NULL)

-- job_id: job_qEFpgcu8ZJyz7zh_c3BReOggKzaC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:09.313000+00:00
-- started: 2026-08-03T05:46:09.480000+00:00
-- ended: 2026-08-03T05:46:10.555000+00:00

INSERT INTO `TikTok_JF_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Ads_ef1a5b88_31a1_45bb_a777_ad384a26565f` AS main_table_alias LEFT JOIN `TikTok_JF_Ads` ON main_table_alias.`Id` = `TikTok_JF_Ads`.`Id` WHERE `TikTok_JF_Ads`.`Id` IS NULL)

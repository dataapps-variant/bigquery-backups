-- job_id: job_YbUA7gI1orGBjfnJ75cWxRLyGry1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:15.742000+00:00
-- started: 2026-07-28T05:46:15.906000+00:00
-- ended: 2026-07-28T05:46:16.939000+00:00

INSERT INTO `TikTok_DT_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_Ads_83250e41_809e_4045_99f2_52aeb1e5ea6f` AS main_table_alias LEFT JOIN `TikTok_DT_Ads` ON main_table_alias.`Id` = `TikTok_DT_Ads`.`Id` WHERE `TikTok_DT_Ads`.`Id` IS NULL)

-- job_id: job_E34UqccVF4R3rBDxIOvxgBJDX7Bh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:18.359000+00:00
-- started: 2026-07-29T05:46:18.523000+00:00
-- ended: 2026-07-29T05:46:22.106000+00:00

INSERT INTO `TikTok_JF_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Ads_1a34c2fc_89d4_4c76_a524_4724a54a2804` AS main_table_alias LEFT JOIN `TikTok_JF_Ads` ON main_table_alias.`Id` = `TikTok_JF_Ads`.`Id` WHERE `TikTok_JF_Ads`.`Id` IS NULL)

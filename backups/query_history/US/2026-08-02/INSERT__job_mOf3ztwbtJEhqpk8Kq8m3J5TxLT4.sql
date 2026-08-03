-- job_id: job_mOf3ztwbtJEhqpk8Kq8m3J5TxLT4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:10.774000+00:00
-- started: 2026-08-02T05:46:10.950000+00:00
-- ended: 2026-08-02T05:46:12.311000+00:00

INSERT INTO `TikTok_JF_Ads` (`Id`, `AdGroupId`, `Name`, `IdentityId`, `IdentityType`, `CampaignId`, `AdvertiserId`, `CampaignName`, `LandingPageUrl`, `LandingPageUrls`, `DisplayName`, `ProfileImageUrl`, `ImpressionTrackingUrl`, `ClickTrackingUrl`, `PlayableUrl`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`AdGroupId`,main_table_alias.`Name`,main_table_alias.`IdentityId`,main_table_alias.`IdentityType`,main_table_alias.`CampaignId`,main_table_alias.`AdvertiserId`,main_table_alias.`CampaignName`,main_table_alias.`LandingPageUrl`,main_table_alias.`LandingPageUrls`,main_table_alias.`DisplayName`,main_table_alias.`ProfileImageUrl`,main_table_alias.`ImpressionTrackingUrl`,main_table_alias.`ClickTrackingUrl`,main_table_alias.`PlayableUrl`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Ads_27b61c0c_dfc7_45e1_b7a4_89a6b12a4775` AS main_table_alias LEFT JOIN `TikTok_JF_Ads` ON main_table_alias.`Id` = `TikTok_JF_Ads`.`Id` WHERE `TikTok_JF_Ads`.`Id` IS NULL)

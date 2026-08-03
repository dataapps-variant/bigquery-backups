-- job_id: job_HK84tDSvekZ5jy4xhuc3RrjFpNZS
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T05:46:14.101000+00:00
-- started: 2026-07-28T05:46:14.373000+00:00
-- ended: 2026-07-28T05:46:15.560000+00:00

UPDATE `TikTok_DT_Ads` t1 SET t1.`AdGroupId` = t2.`AdGroupId`, t1.`Name` = t2.`Name`, t1.`IdentityId` = t2.`IdentityId`, t1.`IdentityType` = t2.`IdentityType`, t1.`CampaignId` = t2.`CampaignId`, t1.`AdvertiserId` = t2.`AdvertiserId`, t1.`CampaignName` = t2.`CampaignName`, t1.`LandingPageUrl` = t2.`LandingPageUrl`, t1.`LandingPageUrls` = t2.`LandingPageUrls`, t1.`DisplayName` = t2.`DisplayName`, t1.`ProfileImageUrl` = t2.`ProfileImageUrl`, t1.`ImpressionTrackingUrl` = t2.`ImpressionTrackingUrl`, t1.`ClickTrackingUrl` = t2.`ClickTrackingUrl`, t1.`PlayableUrl` = t2.`PlayableUrl`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_Ads_83250e41_809e_4045_99f2_52aeb1e5ea6f` t2 WHERE t1.`Id` = t2.`Id`

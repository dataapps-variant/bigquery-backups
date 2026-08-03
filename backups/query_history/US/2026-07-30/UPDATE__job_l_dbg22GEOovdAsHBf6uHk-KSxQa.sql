-- job_id: job_l_dbg22GEOovdAsHBf6uHk-KSxQa
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:46:07.675000+00:00
-- started: 2026-07-30T05:46:08.058000+00:00
-- ended: 2026-07-30T05:46:09.277000+00:00

UPDATE `TikTok_JF_Ads` t1 SET t1.`AdGroupId` = t2.`AdGroupId`, t1.`Name` = t2.`Name`, t1.`IdentityId` = t2.`IdentityId`, t1.`IdentityType` = t2.`IdentityType`, t1.`CampaignId` = t2.`CampaignId`, t1.`AdvertiserId` = t2.`AdvertiserId`, t1.`CampaignName` = t2.`CampaignName`, t1.`LandingPageUrl` = t2.`LandingPageUrl`, t1.`LandingPageUrls` = t2.`LandingPageUrls`, t1.`DisplayName` = t2.`DisplayName`, t1.`ProfileImageUrl` = t2.`ProfileImageUrl`, t1.`ImpressionTrackingUrl` = t2.`ImpressionTrackingUrl`, t1.`ClickTrackingUrl` = t2.`ClickTrackingUrl`, t1.`PlayableUrl` = t2.`PlayableUrl`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_Ads_85bdba4f_985f_49f6_a9af_0f17104abd59` t2 WHERE t1.`Id` = t2.`Id`

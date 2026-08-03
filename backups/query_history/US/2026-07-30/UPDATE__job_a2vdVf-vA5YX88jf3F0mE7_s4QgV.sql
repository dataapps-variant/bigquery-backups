-- job_id: job_a2vdVf-vA5YX88jf3F0mE7_s4QgV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:46:02.137000+00:00
-- started: 2026-07-30T05:46:02.510000+00:00
-- ended: 2026-07-30T05:46:04.273000+00:00

UPDATE `TikTok_CT_Ads` t1 SET t1.`AdGroupId` = t2.`AdGroupId`, t1.`Name` = t2.`Name`, t1.`IdentityId` = t2.`IdentityId`, t1.`IdentityType` = t2.`IdentityType`, t1.`CampaignId` = t2.`CampaignId`, t1.`AdvertiserId` = t2.`AdvertiserId`, t1.`CampaignName` = t2.`CampaignName`, t1.`LandingPageUrl` = t2.`LandingPageUrl`, t1.`LandingPageUrls` = t2.`LandingPageUrls`, t1.`DisplayName` = t2.`DisplayName`, t1.`ProfileImageUrl` = t2.`ProfileImageUrl`, t1.`ImpressionTrackingUrl` = t2.`ImpressionTrackingUrl`, t1.`ClickTrackingUrl` = t2.`ClickTrackingUrl`, t1.`PlayableUrl` = t2.`PlayableUrl`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Ads_9973bf76_e233_44c6_ab22_90f8c6d07544` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_gz2dWp9dByc8JtRn9j7msLwmVZ-6
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T05:45:59.450000+00:00
-- started: 2026-08-02T05:45:59.805000+00:00
-- ended: 2026-08-02T05:46:00.802000+00:00

UPDATE `TikTok_CT_Ads` t1 SET t1.`AdGroupId` = t2.`AdGroupId`, t1.`Name` = t2.`Name`, t1.`IdentityId` = t2.`IdentityId`, t1.`IdentityType` = t2.`IdentityType`, t1.`CampaignId` = t2.`CampaignId`, t1.`AdvertiserId` = t2.`AdvertiserId`, t1.`CampaignName` = t2.`CampaignName`, t1.`LandingPageUrl` = t2.`LandingPageUrl`, t1.`LandingPageUrls` = t2.`LandingPageUrls`, t1.`DisplayName` = t2.`DisplayName`, t1.`ProfileImageUrl` = t2.`ProfileImageUrl`, t1.`ImpressionTrackingUrl` = t2.`ImpressionTrackingUrl`, t1.`ClickTrackingUrl` = t2.`ClickTrackingUrl`, t1.`PlayableUrl` = t2.`PlayableUrl`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Ads_23e85e0c_e946_4cc7_a265_c68469a77282` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_uEuejYICcVB-NsNXrY8qUNTf-Xxf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:46:15.009000+00:00
-- started: 2026-07-30T05:46:15.361000+00:00
-- ended: 2026-07-30T05:46:16.548000+00:00

UPDATE `Linkedin_Ads` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name` FROM `Linkedin_Ads_d7340ade_1a01_4b2f_be60_4a1a8c8f0d83` t2 WHERE t1.`Id` = t2.`Id`

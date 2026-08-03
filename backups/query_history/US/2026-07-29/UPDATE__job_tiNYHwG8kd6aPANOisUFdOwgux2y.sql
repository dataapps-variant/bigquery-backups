-- job_id: job_tiNYHwG8kd6aPANOisUFdOwgux2y
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-29T05:46:14.651000+00:00
-- started: 2026-07-29T05:46:14.972000+00:00
-- ended: 2026-07-29T05:46:22.036000+00:00

UPDATE `Linkedin_Ads` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name` FROM `Linkedin_Ads_09511dfa_311c_4879_b50e_e51c2ad4f6e9` t2 WHERE t1.`Id` = t2.`Id`

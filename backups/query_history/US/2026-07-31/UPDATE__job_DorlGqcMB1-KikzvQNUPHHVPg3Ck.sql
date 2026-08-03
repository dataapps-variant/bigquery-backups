-- job_id: job_DorlGqcMB1-KikzvQNUPHHVPg3Ck
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T05:46:13.715000+00:00
-- started: 2026-07-31T05:46:14.042000+00:00
-- ended: 2026-07-31T05:46:15.146000+00:00

UPDATE `Linkedin_Ads` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name` FROM `Linkedin_Ads_3b121341_66ac_4b2c_ad90_d6dd70a77f30` t2 WHERE t1.`Id` = t2.`Id`

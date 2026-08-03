-- job_id: job_RNAg4qN6DCREDslL3HIQ8knfSEFo
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-03T05:46:09.585000+00:00
-- started: 2026-08-03T05:46:09.976000+00:00
-- ended: 2026-08-03T05:46:10.965000+00:00

UPDATE `Linkedin_Ads` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name` FROM `Linkedin_Ads_12e24ef1_975f_432c_a67c_2fe3e2894a32` t2 WHERE t1.`Id` = t2.`Id`

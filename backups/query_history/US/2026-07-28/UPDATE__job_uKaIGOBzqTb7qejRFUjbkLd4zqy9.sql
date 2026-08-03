-- job_id: job_uKaIGOBzqTb7qejRFUjbkLd4zqy9
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T05:46:19.269000+00:00
-- started: 2026-07-28T05:46:19.578000+00:00
-- ended: 2026-07-28T05:46:22.209000+00:00

UPDATE `Linkedin_Ads` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name` FROM `Linkedin_Ads_b2940bcd_bc77_4806_8f51_86691971a6b7` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_9faWWzQhaTBJhM88J21NVD4ykraR
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T05:46:11.773000+00:00
-- started: 2026-08-02T05:46:12.079000+00:00
-- ended: 2026-08-02T05:46:13.066000+00:00

UPDATE `Linkedin_Ads` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name` FROM `Linkedin_Ads_860380e8_de11_4ae0_b13f_a79d7b0a208f` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_yac9fXQJtkAaJ-IzRKyZhCY4UhyB
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-01T05:46:12.672000+00:00
-- started: 2026-08-01T05:46:12.929000+00:00
-- ended: 2026-08-01T05:46:14.616000+00:00

UPDATE `Linkedin_Ads` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name` FROM `Linkedin_Ads_66de8e7e_6b3e_4624_abaf_fda22c73640e` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_No7LGF8F2mXqFGL4IGN-OYzGf_vZ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-01T05:46:16.180000+00:00
-- started: 2026-08-01T05:46:16.471000+00:00
-- ended: 2026-08-01T05:46:17.613000+00:00

UPDATE `Linkedin_Campaigns` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`Locale_Country` = t2.`Locale_Country`, t1.`CostType` = t2.`CostType`, t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type` FROM `Linkedin_Campaigns_503adcfd_a80f_4934_94a1_ac93a70a968d` t2 WHERE t1.`Id` = t2.`Id`

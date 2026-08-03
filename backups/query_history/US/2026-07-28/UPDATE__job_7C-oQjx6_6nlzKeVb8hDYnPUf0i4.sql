-- job_id: job_7C-oQjx6_6nlzKeVb8hDYnPUf0i4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T05:46:23.047000+00:00
-- started: 2026-07-28T05:46:23.323000+00:00
-- ended: 2026-07-28T05:46:24.365000+00:00

UPDATE `Linkedin_Campaigns` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`Locale_Country` = t2.`Locale_Country`, t1.`CostType` = t2.`CostType`, t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type` FROM `Linkedin_Campaigns_960d048d_809a_4d5f_97da_9d490e12a951` t2 WHERE t1.`Id` = t2.`Id`

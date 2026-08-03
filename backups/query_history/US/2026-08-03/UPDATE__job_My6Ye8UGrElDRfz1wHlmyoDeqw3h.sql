-- job_id: job_My6Ye8UGrElDRfz1wHlmyoDeqw3h
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-03T05:46:11.979000+00:00
-- started: 2026-08-03T05:46:12.346000+00:00
-- ended: 2026-08-03T05:46:13.308000+00:00

UPDATE `Linkedin_Campaigns` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`Locale_Country` = t2.`Locale_Country`, t1.`CostType` = t2.`CostType`, t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type` FROM `Linkedin_Campaigns_faddc979_7627_437f_99c2_a6098dc86239` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_hL8IN-1w_9oVq17iI5G1Ow8fklvH
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:46:18.641000+00:00
-- started: 2026-07-30T05:46:18.994000+00:00
-- ended: 2026-07-30T05:46:20.033000+00:00

UPDATE `Linkedin_Campaigns` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`Locale_Country` = t2.`Locale_Country`, t1.`CostType` = t2.`CostType`, t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type` FROM `Linkedin_Campaigns_053e1046_c0dd_4736_9615_0d25904ce554` t2 WHERE t1.`Id` = t2.`Id`

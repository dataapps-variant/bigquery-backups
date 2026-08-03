-- job_id: job_m_GJRXrU05XgyP7fpZVXk-BIkn_a
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-29T05:46:18.243000+00:00
-- started: 2026-07-29T05:46:18.589000+00:00
-- ended: 2026-07-29T05:46:19.562000+00:00

UPDATE `Linkedin_Campaigns` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`Locale_Country` = t2.`Locale_Country`, t1.`CostType` = t2.`CostType`, t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type` FROM `Linkedin_Campaigns_3fb802c4_1d0a_4a61_ba24_e11d6220d266` t2 WHERE t1.`Id` = t2.`Id`

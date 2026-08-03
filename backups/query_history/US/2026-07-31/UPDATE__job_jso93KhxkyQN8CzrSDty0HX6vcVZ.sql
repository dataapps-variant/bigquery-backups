-- job_id: job_jso93KhxkyQN8CzrSDty0HX6vcVZ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T05:46:16.990000+00:00
-- started: 2026-07-31T05:46:17.301000+00:00
-- ended: 2026-07-31T05:46:18.411000+00:00

UPDATE `Linkedin_Campaigns` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`Locale_Country` = t2.`Locale_Country`, t1.`CostType` = t2.`CostType`, t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type` FROM `Linkedin_Campaigns_fa82be03_7a1c_4982_803a_6b2737900a01` t2 WHERE t1.`Id` = t2.`Id`

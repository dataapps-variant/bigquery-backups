-- job_id: job_ZfiTz_gletq2u4HpQjO5p28ouA0x
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T05:46:14.874000+00:00
-- started: 2026-08-02T05:46:15.128000+00:00
-- ended: 2026-08-02T05:46:16.278000+00:00

UPDATE `Linkedin_Campaigns` t1 SET t1.`AccountId` = t2.`AccountId`, t1.`Locale_Country` = t2.`Locale_Country`, t1.`CostType` = t2.`CostType`, t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type` FROM `Linkedin_Campaigns_e6698d7d_c106_477f_baba_72d4187d8771` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_RPU7EmAOu4hcH5NHQ-25_Y3cAqwU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T05:46:03.247000+00:00
-- started: 2026-07-31T05:46:03.796000+00:00
-- ended: 2026-07-31T05:46:04.711000+00:00

UPDATE `TikTok_JF_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_Campaigns_ff66f90f_29ac_4c47_b4e3_85094f6cfe38` t2 WHERE t1.`Id` = t2.`Id`

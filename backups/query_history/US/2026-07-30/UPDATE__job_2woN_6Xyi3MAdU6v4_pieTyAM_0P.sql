-- job_id: job_2woN_6Xyi3MAdU6v4_pieTyAM_0P
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:45:59.030000+00:00
-- started: 2026-07-30T05:45:59.370000+00:00
-- ended: 2026-07-30T05:46:00.538000+00:00

UPDATE `TikTok_DT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_Campaigns_f683cbbd_e041_4256_b9dd_1e0e86cdd044` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_TZrm9bENCX7Krjpfv1Y085RDKmFh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-29T05:46:07.048000+00:00
-- started: 2026-07-29T05:46:07.372000+00:00
-- ended: 2026-07-29T05:46:08.478000+00:00

UPDATE `TikTok_DT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_Campaigns_f65d002a_c194_41fb_a4f6_2c94f66e34ef` t2 WHERE t1.`Id` = t2.`Id`

-- job_id: job_ADhS03vtWa6T8hvlDjjT5Wef8ZXz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-03T05:45:55.726000+00:00
-- started: 2026-08-03T05:45:56.061000+00:00
-- ended: 2026-08-03T05:45:57.037000+00:00

UPDATE `TikTok_CT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Campaigns_1810d1e8_0a06_4f37_bf61_ec094a1e63a3` t2 WHERE t1.`Id` = t2.`Id`

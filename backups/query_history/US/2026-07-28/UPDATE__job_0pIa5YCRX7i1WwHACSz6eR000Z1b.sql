-- job_id: job_0pIa5YCRX7i1WwHACSz6eR000Z1b
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T05:46:12.310000+00:00
-- started: 2026-07-28T05:46:12.667000+00:00
-- ended: 2026-07-28T05:46:13.719000+00:00

UPDATE `TikTok_CT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Campaigns_1bd971af_5c6b_42f7_a4d8_a96e5285745a` t2 WHERE t1.`Id` = t2.`Id`

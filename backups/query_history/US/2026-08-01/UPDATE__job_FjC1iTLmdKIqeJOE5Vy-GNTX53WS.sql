-- job_id: job_FjC1iTLmdKIqeJOE5Vy-GNTX53WS
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-01T05:45:58.675000+00:00
-- started: 2026-08-01T05:45:59.005000+00:00
-- ended: 2026-08-01T05:46:00.162000+00:00

UPDATE `TikTok_DT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_Campaigns_816a852d_87ec_4b68_acd1_ce0ed1039370` t2 WHERE t1.`Id` = t2.`Id`

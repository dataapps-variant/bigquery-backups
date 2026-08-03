-- job_id: job_GB8ikA3rbP3J9VtZ15Ix12oUfljz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-03T05:45:55.581000+00:00
-- started: 2026-08-03T05:45:55.991000+00:00
-- ended: 2026-08-03T05:45:57.164000+00:00

UPDATE `TikTok_DT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_Campaigns_1e207907_0aad_4ee0_bd3b_4747d760e27c` t2 WHERE t1.`Id` = t2.`Id`

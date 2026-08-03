-- job_id: job_lbzs2ggx4YjNRsh6RFHVjdqqbk4f
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-29T05:46:04.772000+00:00
-- started: 2026-07-29T05:46:05.133000+00:00
-- ended: 2026-07-29T05:46:06.307000+00:00

UPDATE `TikTok_CT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Campaigns_e9f29be3_a063_4b20_bdf7_45204a9ba7ec` t2 WHERE t1.`Id` = t2.`Id`

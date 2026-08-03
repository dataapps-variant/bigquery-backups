-- job_id: job_IH_kXYOOKToXh1g2XIe0k2fRjSVu
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T05:46:13.896000+00:00
-- started: 2026-07-28T05:46:14.232000+00:00
-- ended: 2026-07-28T05:46:15.365000+00:00

UPDATE `TikTok_DT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_Campaigns_3448bfd2_5b32_4aea_bc9e_17490528d413` t2 WHERE t1.`Id` = t2.`Id`

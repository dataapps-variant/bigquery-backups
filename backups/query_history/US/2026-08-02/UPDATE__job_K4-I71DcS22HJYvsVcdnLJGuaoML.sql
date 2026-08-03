-- job_id: job_K4-I71DcS22HJYvsVcdnLJGuaoML
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T05:46:02.049000+00:00
-- started: 2026-08-02T05:46:02.367000+00:00
-- ended: 2026-08-02T05:46:03.344000+00:00

UPDATE `TikTok_JF_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_Campaigns_84946b6b_7def_46ba_89be_8becdefe6fb3` t2 WHERE t1.`Id` = t2.`Id`

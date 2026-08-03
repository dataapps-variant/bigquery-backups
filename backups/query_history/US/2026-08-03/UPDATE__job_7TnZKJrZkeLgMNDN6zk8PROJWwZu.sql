-- job_id: job_7TnZKJrZkeLgMNDN6zk8PROJWwZu
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-03T05:45:56.967000+00:00
-- started: 2026-08-03T05:45:57.304000+00:00
-- ended: 2026-08-03T05:45:58.269000+00:00

UPDATE `TikTok_JF_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_Campaigns_af1d8a8d_34ee_461d_a630_c238f7211f44` t2 WHERE t1.`Id` = t2.`Id`

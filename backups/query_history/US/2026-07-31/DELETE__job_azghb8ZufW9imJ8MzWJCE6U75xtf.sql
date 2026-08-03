-- job_id: job_azghb8ZufW9imJ8MzWJCE6U75xtf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:06.439000+00:00
-- started: 2026-07-31T05:46:06.785000+00:00
-- ended: 2026-07-31T05:46:07.673000+00:00

DELETE FROM `TikTok_DT_Campaigns` WHERE `TikTok_DT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Campaigns_fc859531_b8ab_4723_8251_513c33664e65` AS main_table_alias)

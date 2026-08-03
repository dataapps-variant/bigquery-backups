-- job_id: job_DbrHCkQAI7QXyBEZyd-H_bsW32Qb
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:59.669000+00:00
-- started: 2026-08-03T05:45:59.990000+00:00
-- ended: 2026-08-03T05:46:00.865000+00:00

DELETE FROM `TikTok_DT_Campaigns` WHERE `TikTok_DT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_Campaigns_f2b7cc7c_2547_4ecf_a81d_701461f59714` AS main_table_alias)

-- job_id: job_1QcTkj97yc3lmgFfiuVVLYqPzwPH
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:08.636000+00:00
-- started: 2026-07-29T05:46:08.967000+00:00
-- ended: 2026-07-29T05:46:10.208000+00:00

DELETE FROM `TikTok_CT_Campaigns` WHERE `TikTok_CT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Campaigns_25e8ae1d_ec94_4043_a9b7_abd7cf9dec00` AS main_table_alias)

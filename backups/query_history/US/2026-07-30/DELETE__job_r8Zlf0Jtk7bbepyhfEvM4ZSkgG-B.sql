-- job_id: job_r8Zlf0Jtk7bbepyhfEvM4ZSkgG-B
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:05.422000+00:00
-- started: 2026-07-30T05:46:05.792000+00:00
-- ended: 2026-07-30T05:46:06.926000+00:00

DELETE FROM `TikTok_CT_Campaigns` WHERE `TikTok_CT_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_CT_Campaigns_b7d3d86d_3855_4b1d_9a7f_279d9035f2ff` AS main_table_alias)

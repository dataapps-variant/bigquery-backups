-- job_id: job_D4MdYpWd3a71ju432ZSB75F9mbKP
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:09.208000+00:00
-- started: 2026-07-31T05:46:09.592000+00:00
-- ended: 2026-07-31T05:46:10.578000+00:00

DELETE FROM `TikTok_JF_Campaigns` WHERE `TikTok_JF_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Campaigns_02e7ec52_726c_4317_8458_7116b02df8a2` AS main_table_alias)

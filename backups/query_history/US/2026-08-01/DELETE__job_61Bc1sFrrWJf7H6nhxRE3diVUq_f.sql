-- job_id: job_61Bc1sFrrWJf7H6nhxRE3diVUq_f
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:03.741000+00:00
-- started: 2026-08-01T05:46:04.061000+00:00
-- ended: 2026-08-01T05:46:05.078000+00:00

DELETE FROM `TikTok_DT_AdGroups` WHERE `TikTok_DT_AdGroups`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_DT_AdGroups_b34661f3_9fdd_45b1_b72a_11fda235138a` AS main_table_alias)

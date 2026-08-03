-- job_id: job_zXgNAVTwD6BjfjEfHr71vhTiDbaV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:24.582000+00:00
-- started: 2026-07-28T05:46:24.873000+00:00
-- ended: 2026-07-28T05:46:25.924000+00:00

DELETE FROM `Linkedin_Ads` WHERE `Linkedin_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Ads_8c3e67d7_568e_4e80_aa7a_f917571276ad` AS main_table_alias)

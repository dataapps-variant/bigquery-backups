-- job_id: job_LCD8HwgYEZ9NVAknEBoXTanUWnKL
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:19.567000+00:00
-- started: 2026-08-01T05:46:19.808000+00:00
-- ended: 2026-08-01T05:46:20.699000+00:00

DELETE FROM `Linkedin_Campaigns` WHERE `Linkedin_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Campaigns_236e4762_7277_4bec_9e73_962e87e1f80f` AS main_table_alias)

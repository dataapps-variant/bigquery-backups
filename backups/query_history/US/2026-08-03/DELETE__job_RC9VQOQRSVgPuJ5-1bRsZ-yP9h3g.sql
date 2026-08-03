-- job_id: job_RC9VQOQRSVgPuJ5-1bRsZ-yP9h3g
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:13.251000+00:00
-- started: 2026-08-03T05:46:13.773000+00:00
-- ended: 2026-08-03T05:46:14.730000+00:00

DELETE FROM `Linkedin_Ads` WHERE `Linkedin_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Ads_bb08a6c9_7d96_4bc5_a086_f07da4b4718c` AS main_table_alias)

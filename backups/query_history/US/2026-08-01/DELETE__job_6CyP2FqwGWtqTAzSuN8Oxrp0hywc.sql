-- job_id: job_6CyP2FqwGWtqTAzSuN8Oxrp0hywc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:16.867000+00:00
-- started: 2026-08-01T05:46:17.342000+00:00
-- ended: 2026-08-01T05:46:18.758000+00:00

DELETE FROM `Linkedin_Ads` WHERE `Linkedin_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Ads_115e29d8_db06_4b42_bbef_850480308044` AS main_table_alias)

-- job_id: job_7NAUTxYt71xo62Q1pNw3TQNUj9p0
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:11.157000+00:00
-- started: 2026-08-03T05:46:11.324000+00:00
-- ended: 2026-08-03T05:46:12.132000+00:00

INSERT INTO `Linkedin_Ads` (`Id`, `AccountId`, `CampaignId`, `Name`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`CampaignId`,main_table_alias.`Name`  FROM `Linkedin_Ads_12e24ef1_975f_432c_a67c_2fe3e2894a32` AS main_table_alias LEFT JOIN `Linkedin_Ads` ON main_table_alias.`Id` = `Linkedin_Ads`.`Id` WHERE `Linkedin_Ads`.`Id` IS NULL)

-- job_id: job_1YcvqAWkUxRGLIfA9lQG9VyZvwj1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:22.424000+00:00
-- started: 2026-07-28T05:46:22.623000+00:00
-- ended: 2026-07-28T05:46:23.569000+00:00

INSERT INTO `Linkedin_Ads` (`Id`, `AccountId`, `CampaignId`, `Name`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`CampaignId`,main_table_alias.`Name`  FROM `Linkedin_Ads_b2940bcd_bc77_4806_8f51_86691971a6b7` AS main_table_alias LEFT JOIN `Linkedin_Ads` ON main_table_alias.`Id` = `Linkedin_Ads`.`Id` WHERE `Linkedin_Ads`.`Id` IS NULL)

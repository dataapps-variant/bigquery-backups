-- job_id: job_ghg-BEtmJV7GJWIk3h8iOgn-v4jt
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:14.741000+00:00
-- started: 2026-08-01T05:46:14.914000+00:00
-- ended: 2026-08-01T05:46:15.847000+00:00

INSERT INTO `Linkedin_Ads` (`Id`, `AccountId`, `CampaignId`, `Name`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`CampaignId`,main_table_alias.`Name`  FROM `Linkedin_Ads_66de8e7e_6b3e_4624_abaf_fda22c73640e` AS main_table_alias LEFT JOIN `Linkedin_Ads` ON main_table_alias.`Id` = `Linkedin_Ads`.`Id` WHERE `Linkedin_Ads`.`Id` IS NULL)

-- job_id: job_Y7vW-sfOmTmyd_EbJIwRKVwjXtWp
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:15.307000+00:00
-- started: 2026-07-31T05:46:15.476000+00:00
-- ended: 2026-07-31T05:46:16.333000+00:00

INSERT INTO `Linkedin_Ads` (`Id`, `AccountId`, `CampaignId`, `Name`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`CampaignId`,main_table_alias.`Name`  FROM `Linkedin_Ads_3b121341_66ac_4b2c_ad90_d6dd70a77f30` AS main_table_alias LEFT JOIN `Linkedin_Ads` ON main_table_alias.`Id` = `Linkedin_Ads`.`Id` WHERE `Linkedin_Ads`.`Id` IS NULL)

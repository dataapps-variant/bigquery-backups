-- job_id: job_ahwzc6L2F70TaTy-BsxRvPa5ZFjL
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:13.250000+00:00
-- started: 2026-08-02T05:46:13.427000+00:00
-- ended: 2026-08-02T05:46:14.342000+00:00

INSERT INTO `Linkedin_Ads` (`Id`, `AccountId`, `CampaignId`, `Name`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`CampaignId`,main_table_alias.`Name`  FROM `Linkedin_Ads_860380e8_de11_4ae0_b13f_a79d7b0a208f` AS main_table_alias LEFT JOIN `Linkedin_Ads` ON main_table_alias.`Id` = `Linkedin_Ads`.`Id` WHERE `Linkedin_Ads`.`Id` IS NULL)

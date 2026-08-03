-- job_id: job_HFTrQ9uJuGFRUx_6x-mRRvZmj0J-
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:16.741000+00:00
-- started: 2026-07-30T05:46:16.939000+00:00
-- ended: 2026-07-30T05:46:19.049000+00:00

INSERT INTO `Linkedin_Ads` (`Id`, `AccountId`, `CampaignId`, `Name`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`CampaignId`,main_table_alias.`Name`  FROM `Linkedin_Ads_d7340ade_1a01_4b2f_be60_4a1a8c8f0d83` AS main_table_alias LEFT JOIN `Linkedin_Ads` ON main_table_alias.`Id` = `Linkedin_Ads`.`Id` WHERE `Linkedin_Ads`.`Id` IS NULL)

-- job_id: job_4qareTzypIlz4xjyTXaEqmSMXmUX
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:22.223000+00:00
-- started: 2026-07-29T05:46:22.407000+00:00
-- ended: 2026-07-29T05:46:23.506000+00:00

INSERT INTO `Linkedin_Ads` (`Id`, `AccountId`, `CampaignId`, `Name`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`CampaignId`,main_table_alias.`Name`  FROM `Linkedin_Ads_09511dfa_311c_4879_b50e_e51c2ad4f6e9` AS main_table_alias LEFT JOIN `Linkedin_Ads` ON main_table_alias.`Id` = `Linkedin_Ads`.`Id` WHERE `Linkedin_Ads`.`Id` IS NULL)

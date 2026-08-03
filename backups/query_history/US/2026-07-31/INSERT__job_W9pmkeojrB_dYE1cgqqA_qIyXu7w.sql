-- job_id: job_W9pmkeojrB_dYE1cgqqA_qIyXu7w
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:06.339000+00:00
-- started: 2026-07-31T05:46:06.479000+00:00
-- ended: 2026-07-31T05:46:07.288000+00:00

INSERT INTO `MS_Ads_EN_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_EN_CampaignPerformanceDailyReport_85e3aeac_dcb1_4992_b562_fcd25ae91ed5` AS main_table_alias)

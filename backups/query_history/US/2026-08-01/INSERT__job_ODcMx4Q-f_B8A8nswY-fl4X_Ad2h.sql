-- job_id: job_ODcMx4Q-f_B8A8nswY-fl4X_Ad2h
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:01.338000+00:00
-- started: 2026-08-01T05:46:01.500000+00:00
-- ended: 2026-08-01T05:46:02.202000+00:00

INSERT INTO `MS_Ads_CN_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CN_CampaignPerformanceDailyReport_8ea5b40a_43fa_401a_8a38_af89e37146a1` AS main_table_alias)

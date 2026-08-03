-- job_id: job_zVq1IPCRG2bpKOUz37tIJ3iqXDIV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:45:59.132000+00:00
-- started: 2026-08-02T05:45:59.277000+00:00
-- ended: 2026-08-02T05:46:00.031000+00:00

INSERT INTO `MS_Ads_IQ_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_CampaignPerformanceDailyReport_b8ac6669_baba_4ee5_9733_6435ffd38a93` AS main_table_alias)

-- job_id: job_HoKBziKirtjHx1xdz9-nMbuzIjW9
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:13.709000+00:00
-- started: 2026-07-30T05:46:13.845000+00:00
-- ended: 2026-07-30T05:46:14.661000+00:00

INSERT INTO `MS_Ads_CL_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CL_CampaignPerformanceDailyReport_64764e02_f185_43c3_8bc0_0a91bf52d606` AS main_table_alias)

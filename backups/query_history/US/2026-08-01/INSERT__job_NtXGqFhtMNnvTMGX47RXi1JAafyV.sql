-- job_id: job_NtXGqFhtMNnvTMGX47RXi1JAafyV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:09.573000+00:00
-- started: 2026-08-01T05:46:09.743000+00:00
-- ended: 2026-08-01T05:46:10.473000+00:00

INSERT INTO `MS_Ads_PD_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_PD_GeographicPerformanceDailyReport_cef5ad6a_5b49_47c6_a6fd_29f34e50a9ae` AS main_table_alias)

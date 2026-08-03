-- job_id: job_ENPndV2lerVB6EVnsKElPFABArhe
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:06.225000+00:00
-- started: 2026-08-02T05:46:06.410000+00:00
-- ended: 2026-08-02T05:46:07.188000+00:00

INSERT INTO `MS_Ads_FS_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_FS_GeographicPerformanceDailyReport_df40dbf6_edb3_4056_8b0e_c3ffe18d23b7` AS main_table_alias)

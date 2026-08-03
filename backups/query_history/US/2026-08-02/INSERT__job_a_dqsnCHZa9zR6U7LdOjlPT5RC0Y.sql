-- job_id: job_a_dqsnCHZa9zR6U7LdOjlPT5RC0Y
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:05.662000+00:00
-- started: 2026-08-02T05:46:05.804000+00:00
-- ended: 2026-08-02T05:46:06.596000+00:00

INSERT INTO `MS_Ads_PD_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_PD_GeographicPerformanceDailyReport_ac7424ed_4a89_4d0f_9f4e_98c72dada410` AS main_table_alias)

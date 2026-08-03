-- job_id: job_gQaKzj66crG64RbTn0rqBq4BwDmC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:07.861000+00:00
-- started: 2026-07-28T05:46:08.053000+00:00
-- ended: 2026-07-28T05:46:09.150000+00:00

INSERT INTO `MS_Ads_CT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CT_GeographicPerformanceDailyReport_900cbc99_a002_496f_b16d_ac701055338d` AS main_table_alias)

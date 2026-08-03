-- job_id: job_irxjWeKR7stPS-zSv5ypLLBhgi4A
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:45:59.641000+00:00
-- started: 2026-08-02T05:45:59.790000+00:00
-- ended: 2026-08-02T05:46:00.579000+00:00

INSERT INTO `TikTok_DT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdsDailyReport_67bac3ab_32d1_4c9d_aaa1_49f81dd1fbfc` AS main_table_alias)

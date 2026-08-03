-- job_id: job_IICdM7976lTvf0jGSECSspgC_8BX
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:03.957000+00:00
-- started: 2026-08-02T05:46:04.132000+00:00
-- ended: 2026-08-02T05:46:10.296000+00:00

INSERT INTO `TikTok_CT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_AdsDailyReport_ccdadabd_3ed4_416d_91f2_7a6c7709a0d3` AS main_table_alias)

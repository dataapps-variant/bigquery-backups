-- TikTok Ad Spend Data Snapshot Script
-- Replace CURRENT_TIMESTAMP with your desired timestamp format
-- For format like 2025-09-10T10_00_00, use FORMAT_TIMESTAMP('%Y-%m-%dT%H_%M_%S', CURRENT_TIMESTAMP())

BEGIN
  DECLARE snapshot_timestamp STRING DEFAULT FORMAT_TIMESTAMP('%Y-%m-%dT%H_%M_%S', CURRENT_TIMESTAMP());
  DECLARE sql_query STRING;

  -- TikTok_CT tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_CT_AdGroups_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_AdGroups`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_CT_Ads_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_Ads`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_CT_AdsDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_AdsDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_CT_Campaigns_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_Campaigns`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_CT_Locations_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_Locations`');
  EXECUTE IMMEDIATE sql_query;

  -- TikTok_DT tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_DT_AdGroups_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_DT_AdGroups`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_DT_Ads_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_DT_Ads`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_DT_AdsDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_DT_AdsDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_DT_Campaigns_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_DT_Campaigns`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_DT_Locations_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_DT_Locations`');
  EXECUTE IMMEDIATE sql_query;

  -- TikTok_JF tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_JF_AdGroups_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_AdGroups`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_JF_Ads_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_Ads`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_JF_AdsDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_AdsDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_JF_Campaigns_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_Campaigns`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.TikTok_JF_Locations_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_Locations`');
  EXECUTE IMMEDIATE sql_query;

END;

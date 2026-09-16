-- Replace CURRENT_TIMESTAMP with your desired timestamp format
-- For format like 2025-09-10T10_00_00, use FORMAT_TIMESTAMP('%Y-%m-%dT%H_%M_%S', CURRENT_TIMESTAMP())

BEGIN
  DECLARE snapshot_timestamp STRING DEFAULT FORMAT_TIMESTAMP('%Y-%m-%dT%H_%M_%S', CURRENT_TIMESTAMP());
  DECLARE sql_query STRING;

  -- MS_Ads_AT tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_AT_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_AT_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_AT_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_AT_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_AT_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_AT_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_CL tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CL_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CL_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CL_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CL_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CL_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CL_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_CN tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CN_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CN_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CN_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CN_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CN_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CN_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_CT tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CT_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CT_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CT_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CT_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_CT_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CT_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_EN tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_EN_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_EN_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_EN_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_EN_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_EN_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_EN_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_FS tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_FS_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_FS_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_FS_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_FS_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_FS_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_FS_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_IQ tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_IQ_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_IQ_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_IQ_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_IQ_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_IQ_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_IQ_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_JF tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_JF_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_JF_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_JF_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_JF_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_JF_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_JF_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_PD tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_PD_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_PD_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_PD_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_PD_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_PD_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_PD_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- MS_Ads_RT tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_RT_AdPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_AdPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_RT_CampaignPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_CampaignPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.MS_Ads_RT_GeographicPerformanceDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_GeographicPerformanceDailyReport`');
  EXECUTE IMMEDIATE sql_query;

END;

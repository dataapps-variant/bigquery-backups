-- Facebook Ad Spend Data Snapshot Script
-- Replace CURRENT_TIMESTAMP with your desired timestamp format
-- For format like 2025-09-10T10_00_00, use FORMAT_TIMESTAMP('%Y-%m-%dT%H_%M_%S', CURRENT_TIMESTAMP())

BEGIN
  DECLARE snapshot_timestamp STRING DEFAULT FORMAT_TIMESTAMP('%Y-%m-%dT%H_%M_%S', CURRENT_TIMESTAMP());
  DECLARE sql_query STRING;

  -- Facebook_Ads_AT tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_AT_Country_Code_map_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_Country_Code_map`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_AT_DailyAdInsights_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_DailyAdInsights`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_AT_URL_map_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_URL_map`');
  EXECUTE IMMEDIATE sql_query;

  -- Facebook_Ads_CT tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_CT_Country_Code_map_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_CT_Country_Code_map`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_CT_DailyAdInsights_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_CT_DailyAdInsights`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_CT_URL_map_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_CT_URL_map`');
  EXECUTE IMMEDIATE sql_query;

  -- Facebook_Ads_JF tables
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_JF_Country_Code_map_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_Country_Code_map`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_JF_DailyAdInsights_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_DailyAdInsights`');
  EXECUTE IMMEDIATE sql_query;

  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Facebook_Ads_JF_URL_map_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_URL_map`');
  EXECUTE IMMEDIATE sql_query;

END;

-- LinkedIn Ad Spend Data Snapshot Script
-- Replace CURRENT_TIMESTAMP with your desired timestamp format
-- For format like 2025-09-10T10_00_00, use FORMAT_TIMESTAMP('%Y-%m-%dT%H_%M_%S', CURRENT_TIMESTAMP())

BEGIN
  DECLARE snapshot_timestamp STRING DEFAULT FORMAT_TIMESTAMP('%Y-%m-%dT%H_%M_%S', CURRENT_TIMESTAMP());
  DECLARE sql_query STRING;

  -- Linkedin_Ads table
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Linkedin_Ads_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Ads`');
  EXECUTE IMMEDIATE sql_query;

  -- Linkedin_AdsDailyReport table
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Linkedin_AdsDailyReport_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_AdsDailyReport`');
  EXECUTE IMMEDIATE sql_query;

  -- Linkedin_Ads_URL table
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Linkedin_Ads_URL_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Ads_URL`');
  EXECUTE IMMEDIATE sql_query;

  -- Linkedin_Campaigns table
  SET sql_query = CONCAT('CREATE OR REPLACE TABLE `variant-finance-data-project.Spend_Data_Snapshot.Linkedin_Campaigns_', snapshot_timestamp, '` AS SELECT * FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Campaigns`');
  EXECUTE IMMEDIATE sql_query;

END;

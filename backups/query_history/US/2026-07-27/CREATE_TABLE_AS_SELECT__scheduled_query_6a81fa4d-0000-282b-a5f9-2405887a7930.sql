-- job_id: scheduled_query_6a81fa4d-0000-282b-a5f9-2405887a7930
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-27T15:36:01.831000+00:00
-- started: 2026-07-27T15:36:02.440000+00:00
-- ended: 2026-07-27T15:36:04.354000+00:00

-- ============================================================================
-- CREATE MISSING VALUES TABLE - VALIDATIONS 41-51 (EXCLUDING 50 - TIKTOK)
-- ============================================================================
-- Creates table: variant-finance-data-project.Verifications.Verification_41-51
-- Note: Validation 50 (TikTok CT Locations) has been excluded per request
-- ============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Verification_41-52` AS

WITH 
-- ============================================================================
-- VALIDATION 41: Missing Country from MS Ads CN Geographic
-- ============================================================================
missing_41 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_CN_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CN_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 42: Missing Country from MS Ads CT Geographic
-- ============================================================================
missing_42 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_CT_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CT_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 43: Missing Country from MS Ads EN Geographic
-- ============================================================================
missing_43 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_EN_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_EN_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 44: Missing Country from MS Ads FS Geographic
-- ============================================================================
missing_44 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_FS_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_FS_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 45: Missing Country from MS Ads IQ Geographic
-- ============================================================================
missing_45 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_IQ_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_IQ_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 46: Missing Country from MS Ads JF Geographic (First)
-- ============================================================================
missing_46 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_JF_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_JF_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 47: Missing Country from MS Ads JF Geographic (Duplicate)
-- ============================================================================
-- Note: This appears to be a duplicate of validation 46 in the CSV
missing_47 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_JF_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_JF_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 48: Missing Country from MS Ads PD Geographic
-- ============================================================================
missing_48 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_PD_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_PD_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 49: Missing Country from MS Ads RT Geographic
-- ============================================================================
missing_49 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_RT_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
),


-- ============================================================================
-- VALIDATION 51: Missing External Customer ID from Google Ad Performance
-- ============================================================================
missing_51 AS (
  SELECT 
    'Dim_google_custid_appname_map' AS missing_in_table,
    'external_customer_id' AS field_name_in_missing_table,
    'ad_performance' AS available_in_table,
    'external_customer_id' AS field_name_in_available_table,
    t2.external_customer_id AS missing_value
  FROM (
    SELECT DISTINCT CAST(external_customer_id AS STRING) AS external_customer_id
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance`
    WHERE external_customer_id IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(external_customer_id AS STRING) AS external_customer_id
    FROM `variant-finance-data-project.Ad_spend_data.Dim_google_custid_appname_map`
  ) t1
    ON t2.external_customer_id = t1.external_customer_id
  WHERE t1.external_customer_id IS NULL
),

-- ============================================================================
-- VALIDATION 52: Missing Decline Reasons
-- ============================================================================
missing_52 AS (
  SELECT 
    'Dim_Decline_Reasons' AS missing_in_table,
    'Decline_Reason' AS field_name_in_missing_table,
    'Sticky_data_API_Original_V_W_EC_Merged_TBL' AS available_in_table,
    'Decline_Reason' AS field_name_in_available_table,
    t2.Decline_Reason AS missing_value
  FROM (
    SELECT DISTINCT CAST(Decline_Reason AS STRING) AS Decline_Reason
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
    WHERE Decline_Reason IS NOT NULL 
      AND TRIM(CAST(Decline_Reason AS STRING)) != ''
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Decline_Reason AS STRING) AS Decline_Reason
    FROM `variant-finance-data-project.Daedalus.Decline_Reason_Final`
  ) t1
    ON t2.Decline_Reason = t1.Decline_Reason
  WHERE t1.Decline_Reason IS NULL
)

-- ============================================================================
-- FINAL OUTPUT: CREATE TABLE WITH ALL MISSING VALUES
-- ============================================================================
SELECT 
  CURRENT_TIMESTAMP() AS validation_run_timestamp,
  missing_in_table,
  field_name_in_missing_table,
  available_in_table,
  field_name_in_available_table,
  missing_value
FROM (
  SELECT * FROM missing_41
  UNION ALL SELECT * FROM missing_42
  UNION ALL SELECT * FROM missing_43
  UNION ALL SELECT * FROM missing_44
  UNION ALL SELECT * FROM missing_45
  UNION ALL SELECT * FROM missing_46
  UNION ALL SELECT * FROM missing_47
  UNION ALL SELECT * FROM missing_48
  UNION ALL SELECT * FROM missing_49
  UNION ALL SELECT * FROM missing_51
  UNION ALL SELECT * FROM missing_52
)
ORDER BY 
  missing_in_table,
  available_in_table,
  missing_value;

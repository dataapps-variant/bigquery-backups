-- job_id: scheduled_query_6a6f145d-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T01:35:04.487000+00:00
-- started: 2026-07-29T01:35:04.876000+00:00
-- ended: 2026-07-29T01:35:06.431000+00:00

-- ============================================================================
-- CREATE MISSING VALUES TABLE - VALIDATIONS 31-40
-- ============================================================================
-- Creates table: variant-finance-data-project.Verifications.Verification_31-40
-- ============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Verification_31-40` AS

WITH 
-- ============================================================================
-- VALIDATION 31: Missing Final URLs from MS Ads JF
-- ============================================================================
missing_31 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_JF_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_JF_AdPerformanceDailyReport`
    WHERE FinalUrl IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.FinalUrl = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 32: Missing Final URLs from MS Ads PD
-- ============================================================================
missing_32 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_PD_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_PD_AdPerformanceDailyReport`
    WHERE FinalUrl IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.FinalUrl = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 33: Missing Final URLs from MS Ads RT
-- ============================================================================
missing_33 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_RT_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_RT_AdPerformanceDailyReport`
    WHERE FinalUrl IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.FinalUrl = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 34: Missing Final URLs from TikTok CT
-- ============================================================================
missing_34 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'TikTok_CT_Ads' AS available_in_table,
    'LandingPageUrl' AS field_name_in_available_table,
    t2.LandingPageUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(LandingPageUrl AS STRING) AS LandingPageUrl
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_CT_Ads`
    WHERE LandingPageUrl IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.LandingPageUrl = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 35: Missing Final URLs from TikTok DT
-- ============================================================================
missing_35 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'TikTok_DT_Ads' AS available_in_table,
    'LandingPageUrl' AS field_name_in_available_table,
    t2.LandingPageUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(LandingPageUrl AS STRING) AS LandingPageUrl
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_DT_Ads`
    WHERE LandingPageUrl IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.LandingPageUrl = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 36: Missing Final URLs from TikTok JF
-- ============================================================================
missing_36 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'TikTok_JF_Ads' AS available_in_table,
    'LandingPageUrl' AS field_name_in_available_table,
    t2.LandingPageUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(LandingPageUrl AS STRING) AS LandingPageUrl
    FROM `variant-finance-data-project.Tiktok_ad_spend_data.TikTok_JF_Ads`
    WHERE LandingPageUrl IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.LandingPageUrl = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 37: Missing Final URLs from Google Ad Performance
-- ============================================================================
missing_37 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'ad_performance' AS available_in_table,
    'final_url' AS field_name_in_available_table,
    t2.final_url AS missing_value
  FROM (
    SELECT DISTINCT CAST(final_url AS STRING) AS final_url
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance`
    WHERE final_url IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.final_url = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 38: Missing Google Customer IDs
-- ============================================================================
missing_38 AS (
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
-- VALIDATION 39: Missing Geocode Country Codes from MS AT
-- ============================================================================
missing_39 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_AT_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_AT_GeographicPerformanceDailyReport`
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
-- VALIDATION 40: Missing Geocode Country Codes from MS CL
-- ============================================================================
missing_40 AS (
  SELECT 
    'Dim_geocode_countrycode_map' AS missing_in_table,
    'Name' AS field_name_in_missing_table,
    'MS_Ads_CL_GeographicPerformanceDailyReport' AS available_in_table,
    'Country' AS field_name_in_available_table,
    t2.Country AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country AS STRING) AS Country
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CL_GeographicPerformanceDailyReport`
    WHERE Country IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Name AS STRING) AS Name
    FROM `variant-finance-data-project.Ad_spend_data.Dim_geocode_countrycode_map`
  ) t1
    ON t2.Country = t1.Name
  WHERE t1.Name IS NULL
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
  SELECT * FROM missing_31
  UNION ALL SELECT * FROM missing_32
  UNION ALL SELECT * FROM missing_33
  UNION ALL SELECT * FROM missing_34
  UNION ALL SELECT * FROM missing_35
  UNION ALL SELECT * FROM missing_36
  UNION ALL SELECT * FROM missing_37
  UNION ALL SELECT * FROM missing_38
  UNION ALL SELECT * FROM missing_39
  UNION ALL SELECT * FROM missing_40
)
ORDER BY 
  missing_in_table,
  available_in_table,
  missing_value;

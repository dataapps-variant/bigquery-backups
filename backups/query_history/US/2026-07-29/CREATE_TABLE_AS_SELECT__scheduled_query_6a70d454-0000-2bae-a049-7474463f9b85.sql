-- job_id: scheduled_query_6a70d454-0000-2bae-a049-7474463f9b85
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T00:35:02.331000+00:00
-- started: 2026-07-29T00:35:02.672000+00:00
-- ended: 2026-07-29T00:35:04.063000+00:00

-- ============================================================================
-- CREATE MISSING VALUES TABLE - VALIDATIONS 21-30
-- ============================================================================
-- Creates table: variant-finance-data-project.Verifications.Verification_21-30
-- ============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Verification_21-30` AS

WITH 
-- ============================================================================
-- VALIDATION 21: Missing Final URLs from Facebook AT
-- ============================================================================
missing_21 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'Facebook_Ads_AT_URL_map' AS available_in_table,
    'URL' AS field_name_in_available_table,
    t2.URL AS missing_value
  FROM (
    SELECT DISTINCT CAST(URL AS STRING) AS URL
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_URL_map`
    WHERE URL IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.URL = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 22: Missing Final URLs from Facebook CT
-- ============================================================================
missing_22 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'Facebook_Ads_CT_URL_map' AS available_in_table,
    'URL' AS field_name_in_available_table,
    t2.URL AS missing_value
  FROM (
    SELECT DISTINCT CAST(URL AS STRING) AS URL
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_CT_URL_map`
    WHERE URL IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.URL = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 23: Missing Final URLs from Facebook JF
-- ============================================================================
missing_23 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'Facebook_Ads_JF_URL_map' AS available_in_table,
    'URL' AS field_name_in_available_table,
    t2.URL AS missing_value
  FROM (
    SELECT DISTINCT CAST(URL AS STRING) AS URL
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_URL_map`
    WHERE URL IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.URL = t1.Final_Url
  WHERE t1.Final_Url IS NULL
),


-- ============================================================================
-- VALIDATION 24: Missing Final URLs from MS Ads AT
-- ============================================================================
missing_24 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_AT_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_AT_AdPerformanceDailyReport`
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
-- VALIDATION 25: Missing Final URLs from MS Ads CL
-- ============================================================================
missing_25 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_CL_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CL_AdPerformanceDailyReport`
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
-- VALIDATION 26: Missing Final URLs from MS Ads CN
-- ============================================================================
missing_26 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_CN_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CN_AdPerformanceDailyReport`
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
-- VALIDATION 27: Missing Final URLs from MS Ads CT
-- ============================================================================
missing_27 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_CT_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_CT_AdPerformanceDailyReport`
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
-- VALIDATION 28: Missing Final URLs from MS Ads EN
-- ============================================================================
missing_28 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_EN_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_EN_AdPerformanceDailyReport`
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
-- VALIDATION 29: Missing Final URLs from MS Ads FS
-- ============================================================================
missing_29 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_FS_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_FS_AdPerformanceDailyReport`
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
-- VALIDATION 30: Missing Final URLs from MS Ads IQ
-- ============================================================================
missing_30 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'MS_Ads_IQ_AdPerformanceDailyReport' AS available_in_table,
    'FinalUrl' AS field_name_in_available_table,
    t2.FinalUrl AS missing_value
  FROM (
    SELECT DISTINCT CAST(FinalUrl AS STRING) AS FinalUrl
    FROM `variant-finance-data-project.MS_ad_spend_data.MS_Ads_IQ_AdPerformanceDailyReport`
    WHERE FinalUrl IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.FinalUrl = t1.Final_Url
  WHERE t1.Final_Url IS NULL
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
  SELECT * FROM missing_21
  UNION ALL SELECT * FROM missing_22
  UNION ALL SELECT * FROM missing_23
  UNION ALL SELECT * FROM missing_24
  UNION ALL SELECT * FROM missing_25
  UNION ALL SELECT * FROM missing_26
  UNION ALL SELECT * FROM missing_27
  UNION ALL SELECT * FROM missing_28
  UNION ALL SELECT * FROM missing_29
  UNION ALL SELECT * FROM missing_30
)
ORDER BY 
  missing_in_table,
  available_in_table,
  missing_value;

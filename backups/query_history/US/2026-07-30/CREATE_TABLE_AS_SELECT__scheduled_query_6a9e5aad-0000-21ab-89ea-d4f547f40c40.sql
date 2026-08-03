-- job_id: scheduled_query_6a9e5aad-0000-21ab-89ea-d4f547f40c40
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T10:35:01.910000+00:00
-- started: 2026-07-30T10:35:02.435000+00:00
-- ended: 2026-07-30T10:35:04.055000+00:00

-- ============================================================================
-- CREATE MISSING VALUES TABLE - VALIDATIONS 11-20
-- ============================================================================
-- Creates table: variant-finance-data-project.Verifications.Verification_11-20
-- ============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Verification_11-20` AS

WITH 
-- ============================================================================
-- VALIDATION 11: Missing SS Products
-- ============================================================================
missing_11 AS (
  SELECT 
    'Sticky_Dim_SS' AS missing_in_table,
    'Product_Name_Final_SS' AS field_name_in_missing_table,
    'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
    'Product_Name_Final' AS field_name_in_available_table,
    t2.Product_Name_Final AS missing_value
  FROM (
    SELECT DISTINCT CAST(Product_Name_Final AS STRING) AS Product_Name_Final
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Product_Name_Final IS NOT NULL
      AND ENDS_WITH(CAST(Product_Name_Final AS STRING), 'SS')
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Product_Name_Final_SS AS STRING) AS Product_Name_Final_SS
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_SS`
  ) t1
    ON t2.Product_Name_Final = t1.Product_Name_Final_SS
  WHERE t1.Product_Name_Final_SS IS NULL
),


-- ============================================================================
-- VALIDATION 12: Missing Facebook AT Country Code Map
-- ============================================================================
missing_12 AS (
  SELECT 
    'Facebook_Ads_AT_Country_Code_map' AS missing_in_table,
    'Ad ID' AS field_name_in_missing_table,
    'Facebook_Ads_AT_DailyAdInsights' AS available_in_table,
    'AdId' AS field_name_in_available_table,
    t2.AdId AS missing_value
  FROM (
    SELECT DISTINCT CAST(AdId AS STRING) AS AdId
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_DailyAdInsights`
    WHERE AdId IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(`Ad ID` AS STRING) AS `Ad ID`
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_Country_Code_map`
  ) t1
    ON t2.AdId = t1.`Ad ID`
  WHERE t1.`Ad ID` IS NULL
),


-- ============================================================================
-- VALIDATION 13: Missing Facebook AT URL Map
-- ============================================================================
missing_13 AS (
  SELECT 
    'Facebook_Ads_AT_URL_map' AS missing_in_table,
    'Ad ID' AS field_name_in_missing_table,
    'Facebook_Ads_AT_DailyAdInsights' AS available_in_table,
    'AdId' AS field_name_in_available_table,
    t2.AdId AS missing_value
  FROM (
    SELECT DISTINCT CAST(AdId AS STRING) AS AdId
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_DailyAdInsights`
    WHERE AdId IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(`Ad ID` AS STRING) AS `Ad ID`
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_AT_URL_map`
  ) t1
    ON t2.AdId = t1.`Ad ID`
  WHERE t1.`Ad ID` IS NULL
),


-- ============================================================================
-- VALIDATION 14: Missing Facebook CT Country Code Map
-- ============================================================================
missing_14 AS (
  SELECT 
    'Facebook_Ads_CT_Country_Code_map' AS missing_in_table,
    'Ad ID' AS field_name_in_missing_table,
    'Facebook_Ads_CT_DailyAdInsights' AS available_in_table,
    'AdId' AS field_name_in_available_table,
    t2.AdId AS missing_value
  FROM (
    SELECT DISTINCT CAST(AdId AS STRING) AS AdId
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_CT_DailyAdInsights`
    WHERE AdId IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(`Ad ID` AS STRING) AS `Ad ID`
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_CT_Country_Code_map`
  ) t1
    ON t2.AdId = t1.`Ad ID`
  WHERE t1.`Ad ID` IS NULL
),


-- ============================================================================
-- VALIDATION 15: Missing Facebook CT URL Map
-- ============================================================================
missing_15 AS (
  SELECT 
    'Facebook_Ads_CT_URL_map' AS missing_in_table,
    'Ad ID' AS field_name_in_missing_table,
    'Facebook_Ads_CT_DailyAdInsights' AS available_in_table,
    'AdId' AS field_name_in_available_table,
    t2.AdId AS missing_value
  FROM (
    SELECT DISTINCT CAST(AdId AS STRING) AS AdId
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_CT_DailyAdInsights`
    WHERE AdId IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(`Ad ID` AS STRING) AS `Ad ID`
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_CT_URL_map`
  ) t1
    ON t2.AdId = t1.`Ad ID`
  WHERE t1.`Ad ID` IS NULL
),


-- ============================================================================
-- VALIDATION 16: Missing Facebook JF Country Code Map
-- ============================================================================
missing_16 AS (
  SELECT 
    'Facebook_Ads_JF_Country_Code_map' AS missing_in_table,
    'Ad ID' AS field_name_in_missing_table,
    'Facebook_Ads_JF_DailyAdInsights' AS available_in_table,
    'AdId' AS field_name_in_available_table,
    t2.AdId AS missing_value
  FROM (
    SELECT DISTINCT CAST(AdId AS STRING) AS AdId
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_DailyAdInsights`
    WHERE AdId IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(`Ad ID` AS STRING) AS `Ad ID`
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_Country_Code_map`
  ) t1
    ON t2.AdId = t1.`Ad ID`
  WHERE t1.`Ad ID` IS NULL
),


-- ============================================================================
-- VALIDATION 17: Missing Facebook JF URL Map
-- ============================================================================
missing_17 AS (
  SELECT 
    'Facebook_Ads_JF_URL_map' AS missing_in_table,
    'Ad ID' AS field_name_in_missing_table,
    'Facebook_Ads_JF_DailyAdInsights' AS available_in_table,
    'AdId' AS field_name_in_available_table,
    t2.AdId AS missing_value
  FROM (
    SELECT DISTINCT CAST(AdId AS STRING) AS AdId
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_DailyAdInsights`
    WHERE AdId IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(`Ad ID` AS STRING) AS `Ad ID`
    FROM `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_JF_URL_map`
  ) t1
    ON t2.AdId = t1.`Ad ID`
  WHERE t1.`Ad ID` IS NULL
),


-- ============================================================================
-- VALIDATION 18: Missing LinkedIn Ads URL
-- ============================================================================
missing_18 AS (
  SELECT 
    'Linkedin_Ads_URL' AS missing_in_table,
    'Ad ID' AS field_name_in_missing_table,
    'Linkedin_AdsDailyReport' AS available_in_table,
    'AdId' AS field_name_in_available_table,
    t2.AdId AS missing_value
  FROM (
    SELECT DISTINCT CAST(AdId AS STRING) AS AdId
    FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_AdsDailyReport`
    WHERE AdId IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(`Ad ID` AS STRING) AS `Ad ID`
    FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Ads_URL`
  ) t1
    ON t2.AdId = t1.`Ad ID`
  WHERE t1.`Ad ID` IS NULL
),


-- ============================================================================
-- VALIDATION 19: Missing LinkedIn Customer ID App Name Map
-- ============================================================================
missing_19 AS (
  SELECT 
    'Dim_Linkedin_custid_appname_map' AS missing_in_table,
    'external_customer_id' AS field_name_in_missing_table,
    'Linkedin_Campaigns' AS available_in_table,
    'AccountId' AS field_name_in_available_table,
    t2.AccountId AS missing_value
  FROM (
    SELECT DISTINCT CAST(AccountId AS STRING) AS AccountId
    FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Campaigns`
    WHERE AccountId IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(external_customer_id AS STRING) AS external_customer_id
    FROM `variant-finance-data-project.Ad_spend_data.Dim_Linkedin_custid_appname_map`
  ) t1
    ON t2.AccountId = t1.external_customer_id
  WHERE t1.external_customer_id IS NULL
),

-- ============================================================================
-- VALIDATION 20: Missing Final URL Entity Name Map
-- ============================================================================
missing_20 AS (
  SELECT 
    'Dim_finalurl_entityname_map' AS missing_in_table,
    'Final_Url' AS field_name_in_missing_table,
    'Linkedin_Ads_URL' AS available_in_table,
    'Click URL' AS field_name_in_available_table,
    t2.`Click URL` AS missing_value
  FROM (
    SELECT DISTINCT CAST(`Click URL` AS STRING) AS `Click URL`
    FROM `variant-finance-data-project.Linkedin_ad_spend_data.Linkedin_Ads_URL`
    WHERE `Click URL` IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Final_Url AS STRING) AS Final_Url
    FROM `variant-finance-data-project.Ad_spend_data.Dim_finalurl_entityname_map`
  ) t1
    ON t2.`Click URL` = t1.Final_Url
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
  SELECT * FROM missing_11
  UNION ALL SELECT * FROM missing_12
  UNION ALL SELECT * FROM missing_13
  UNION ALL SELECT * FROM missing_14
  UNION ALL SELECT * FROM missing_15
  UNION ALL SELECT * FROM missing_16
  UNION ALL SELECT * FROM missing_17
  UNION ALL SELECT * FROM missing_18
  UNION ALL SELECT * FROM missing_19
  UNION ALL SELECT * FROM missing_20
)
ORDER BY 
  missing_in_table,
  available_in_table,
  missing_value;

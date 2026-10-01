BEGIN
-- ============================================================================
-- CREATE MISSING VALUES TABLE - VALIDATIONS 1-10
-- ============================================================================
-- Creates table: variant-finance-data-project.Verifications.Verification_1-10
--
-- CHANGE LOG:
--   Validations 1, 2 (AFID), 8 (Gateways), 9 (Offer), 10 (Product) now check
--   the Sticky dimension table FIRST and fall back to the Chargebee dimension
--   table. A value is only reported as missing if it is absent from BOTH.
--   Implemented via *_lookup CTEs using UNION DISTINCT.
--
--   The four Chargebee_Dim_* tables live in the same Sticky_Data dataset.
--
-- >>> VERIFY BEFORE RUNNING: column names of the four Chargebee_Dim_* tables
--     (assumed below to mirror the Sticky equivalents).
-- ============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Verification_1-10` AS

WITH
-- ============================================================================
-- LOOKUP CTEs: Sticky dimension + Chargebee dimension combined
-- ============================================================================
afid_lookup AS (
  SELECT DISTINCT CAST(AFID AS STRING) AS AFID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID`
  WHERE AFID IS NOT NULL
  UNION DISTINCT
  SELECT DISTINCT CAST(AFID AS STRING) AS AFID
  FROM `variant-finance-data-project.Sticky_Data.Chargebee_Dim_AFID`
  WHERE AFID IS NOT NULL
),

gateway_lookup AS (
  SELECT DISTINCT
    CONCAT(CAST(Entity AS STRING), '||', CAST(Gateway_ID AS STRING)) AS combined_key
  FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Gateways`
  WHERE Entity IS NOT NULL AND Gateway_ID IS NOT NULL
  UNION DISTINCT
  SELECT DISTINCT
    CONCAT(CAST(Entity AS STRING), '||', CAST(Gateway_ID AS STRING)) AS combined_key
  FROM `variant-finance-data-project.Sticky_Data.Chargebee_Dim_Gateways`
  WHERE Entity IS NOT NULL AND Gateway_ID IS NOT NULL
),

offer_lookup AS (
  SELECT DISTINCT
    CONCAT(CAST(Entity AS STRING), '||', CAST(ID AS STRING)) AS combined_key
  FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Offer`
  WHERE Entity IS NOT NULL AND ID IS NOT NULL
  UNION DISTINCT
  SELECT DISTINCT
    CONCAT(CAST(Entity AS STRING), '||', CAST(ID AS STRING)) AS combined_key
  FROM `variant-finance-data-project.Sticky_Data.Chargebee_Dim_Offer`
  WHERE Entity IS NOT NULL AND ID IS NOT NULL
),

product_lookup AS (
  SELECT DISTINCT
    CONCAT(CAST(Entity AS STRING), '||', CAST(Product_Id AS STRING)) AS combined_key
  FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Product`
  WHERE Entity IS NOT NULL AND Product_Id IS NOT NULL
  UNION DISTINCT
  SELECT DISTINCT
    CONCAT(CAST(Entity AS STRING), '||', CAST(Product_Id AS STRING)) AS combined_key
  FROM `variant-finance-data-project.Sticky_Data.Chargebee_Dim_Product`
  WHERE Entity IS NOT NULL AND Product_Id IS NOT NULL
),


-- ============================================================================
-- VALIDATION 1: Missing AFIDs  (Sticky -> Chargebee fallback)
-- ============================================================================
missing_1 AS (
  SELECT
    'Sticky_Dim_AFID + Chargebee_Dim_AFID' AS missing_in_table,
    'AFID' AS field_name_in_missing_table,
    'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
    'AFID' AS field_name_in_available_table,
    t2.AFID AS missing_value
  FROM (
    SELECT DISTINCT CAST(AFID AS STRING) AS AFID
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE AFID IS NOT NULL
  ) t2
  LEFT JOIN afid_lookup t1
    ON t2.AFID = t1.AFID
  WHERE t1.AFID IS NULL
),


-- ============================================================================
-- VALIDATION 2: Missing AFIDs from Spend table  (Sticky -> Chargebee fallback)
-- ============================================================================
missing_2 AS (
  SELECT
    'Sticky_Dim_AFID + Chargebee_Dim_AFID' AS missing_in_table,
    'AFID' AS field_name_in_missing_table,
    'Merged_Spend_Split_TBL' AS available_in_table,
    'Final_URL_suffix_AFID' AS field_name_in_available_table,
    t2.Final_URL_suffix_AFID AS missing_value
  FROM (
    SELECT DISTINCT CAST(Final_URL_suffix_AFID AS STRING) AS Final_URL_suffix_AFID
    FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
    WHERE Final_URL_suffix_AFID IS NOT NULL
  ) t2
  LEFT JOIN afid_lookup t1
    ON t2.Final_URL_suffix_AFID = t1.AFID
  WHERE t1.AFID IS NULL
),


-- ============================================================================
-- VALIDATION 3: Missing Country Codes  (unchanged)
-- ============================================================================
missing_3 AS (
  SELECT
    'Sticky_Dim_Country_Code' AS missing_in_table,
    'Country_Code' AS field_name_in_missing_table,
    'Sticky_Dim_AFID' AS available_in_table,
    'Country_Code' AS field_name_in_available_table,
    t2.Country_Code AS missing_value
  FROM (
    SELECT DISTINCT CAST(Country_Code AS STRING) AS Country_Code
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID`
    WHERE Country_Code IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Country_Code AS STRING) AS Country_Code
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Country_Code`
  ) t1
    ON t2.Country_Code = t1.Country_Code
  WHERE t1.Country_Code IS NULL
),


-- ============================================================================
-- VALIDATION 4: Missing Brands (extracted from JSON)  (unchanged)
-- ============================================================================
missing_4 AS (
  SELECT
    'Sticky_Dim_Brand_Map' AS missing_in_table,
    'Brand' AS field_name_in_missing_table,
    'Sticky_data_API_original_JF' AS available_in_table,
    'custom_fields' AS field_name_in_available_table,
    t2.brand_value AS missing_value
  FROM (
    SELECT DISTINCT
      JSON_VALUE(field, '$.values[0].value') as brand_value
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`,
      UNNEST(JSON_EXTRACT_ARRAY(custom_fields)) as field
    WHERE JSON_VALUE(field, '$.token_key') = 'brand'
      AND JSON_VALUE(field, '$.values[0].value') IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Brand AS STRING) AS Brand
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Brand_Map`
  ) t1
    ON t2.brand_value = t1.Brand
  WHERE t1.Brand IS NULL
),


-- ============================================================================
-- VALIDATION 5: Missing Document Types (extracted from JSON)  (unchanged)
-- ============================================================================
missing_5 AS (
  SELECT
    'Sticky_Dim_Document_Type_Map' AS missing_in_table,
    'Document_Type' AS field_name_in_missing_table,
    'Sticky_data_API_original_JF' AS available_in_table,
    'custom_fields' AS field_name_in_available_table,
    t2.document_type_value AS missing_value
  FROM (
    SELECT DISTINCT
      JSON_VALUE(field, '$.values[0].value') as document_type_value
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`,
      UNNEST(JSON_EXTRACT_ARRAY(custom_fields)) as field
    WHERE JSON_VALUE(field, '$.token_key') = 'document_type'
      AND JSON_VALUE(field, '$.values[0].value') IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT CAST(Document_Type AS STRING) AS Document_Type
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Document_Type_Map`
  ) t1
    ON t2.document_type_value = t1.Document_Type
  WHERE t1.Document_Type IS NULL
),


-- ============================================================================
-- VALIDATION 6: Missing Campaigns  (unchanged)
-- ============================================================================
missing_6 AS (
  SELECT
    'Sticky_Dim_Campaign' AS missing_in_table,
    'Entity||Campaign_Id' AS field_name_in_missing_table,
    'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
    'Entity_Name||Campaign_Id' AS field_name_in_available_table,
    t2.combined_key AS missing_value
  FROM (
    SELECT DISTINCT
      CONCAT(CAST(Entity_Name AS STRING), '||', CAST(Campaign_Id AS STRING)) AS combined_key
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Entity_Name IS NOT NULL AND Campaign_Id IS NOT NULL
  ) t2
  LEFT JOIN (
    SELECT DISTINCT
      CONCAT(CAST(Entity AS STRING), '||', CAST(Campaign_Id AS STRING)) AS combined_key
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign`
  ) t1
    ON t2.combined_key = t1.combined_key
  WHERE t1.combined_key IS NULL
),


-- ============================================================================
-- VALIDATION 7: Missing Exchange Rates (excluding USD)  (unchanged)
-- ============================================================================
missing_7 AS (
  SELECT
    'Sticky_Dim_Exchnage_Rate' AS missing_in_table,
    'Date||Currency' AS field_name_in_missing_table,
    'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
    'Date_of_Sale||Currency' AS field_name_in_available_table,
    t2.combined_key AS missing_value
  FROM (
    SELECT DISTINCT
      CONCAT(CAST(Date_of_Sale AS STRING), '||', CAST(Currency AS STRING)) AS combined_key
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Date_of_Sale IS NOT NULL
      AND Currency IS NOT NULL
      AND CAST(Currency AS STRING) != 'USD'
  ) t2
  LEFT JOIN (
    SELECT DISTINCT
      CONCAT(CAST(Date AS STRING), '||', CAST(Currency AS STRING)) AS combined_key
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate`
  ) t1
    ON t2.combined_key = t1.combined_key
  WHERE t1.combined_key IS NULL
),


-- ============================================================================
-- VALIDATION 8: Missing Gateways  (Sticky -> Chargebee fallback)
-- ============================================================================
missing_8 AS (
  SELECT
    'Sticky_Dim_Gateways + Chargebee_Dim_Gateways' AS missing_in_table,
    'Entity||Gateway_ID' AS field_name_in_missing_table,
    'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
    'Entity_Name||Gateway_Id' AS field_name_in_available_table,
    t2.combined_key AS missing_value
  FROM (
    SELECT DISTINCT
      CONCAT(CAST(Entity_Name AS STRING), '||', CAST(Gateway_Id AS STRING)) AS combined_key
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Entity_Name IS NOT NULL AND Gateway_Id IS NOT NULL
  ) t2
  LEFT JOIN gateway_lookup t1
    ON t2.combined_key = t1.combined_key
  WHERE t1.combined_key IS NULL
),


-- ============================================================================
-- VALIDATION 9: Missing Offers  (Sticky -> Chargebee fallback)
-- ============================================================================
missing_9 AS (
  SELECT
    'Sticky_Dim_Offer + Chargebee_Dim_Offer' AS missing_in_table,
    'Entity||ID' AS field_name_in_missing_table,
    'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
    'Entity_Name||Offer_Id' AS field_name_in_available_table,
    t2.combined_key AS missing_value
  FROM (
    SELECT DISTINCT
      CONCAT(CAST(Entity_Name AS STRING), '||', CAST(Offer_Id AS STRING)) AS combined_key
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Entity_Name IS NOT NULL AND Offer_Id IS NOT NULL
  ) t2
  LEFT JOIN offer_lookup t1
    ON t2.combined_key = t1.combined_key
  WHERE t1.combined_key IS NULL
),


-- ============================================================================
-- VALIDATION 10: Missing Products  (Sticky -> Chargebee fallback)
-- ============================================================================
missing_10 AS (
  SELECT
    'Sticky_Dim_Product + Chargebee_Dim_Product' AS missing_in_table,
    'Entity||Product_Id' AS field_name_in_missing_table,
    'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
    'Entity_Name||Product_Id' AS field_name_in_available_table,
    t2.combined_key AS missing_value
  FROM (
    SELECT DISTINCT
      CONCAT(CAST(Entity_Name AS STRING), '||', CAST(Product_Id AS STRING)) AS combined_key
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Entity_Name IS NOT NULL AND Product_Id IS NOT NULL
  ) t2
  LEFT JOIN product_lookup t1
    ON t2.combined_key = t1.combined_key
  WHERE t1.combined_key IS NULL
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
  SELECT * FROM missing_1
  UNION ALL SELECT * FROM missing_2
  UNION ALL SELECT * FROM missing_3
  UNION ALL SELECT * FROM missing_4
  UNION ALL SELECT * FROM missing_5
  UNION ALL SELECT * FROM missing_6
  UNION ALL SELECT * FROM missing_7
  UNION ALL SELECT * FROM missing_8
  UNION ALL SELECT * FROM missing_9
  UNION ALL SELECT * FROM missing_10
)
ORDER BY
  missing_in_table,
  available_in_table,
  missing_value;
END

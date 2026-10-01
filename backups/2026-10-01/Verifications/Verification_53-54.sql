-- =====================================================
-- VERIFICATION SQL #52 & #53 (Combined)
-- Purpose: Show AFIDs mapped with ONLY ONE Channel_name (V52)
--          and ONLY ONE Channel_type (V53)
-- Table: Ad_spend_data.Merged_Spend_Split_TBL
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Verification_52-53` AS

WITH afid_channel_name_mapping AS (
  -- Get distinct combinations of AFID and Channel_name
  SELECT DISTINCT
    Final_URL_suffix_AFID,
    Channel_name
  FROM 
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE 
    Final_URL_suffix_AFID IS NOT NULL 
    AND Final_URL_suffix_AFID != ''
),

afid_channel_name_count AS (
  -- Count how many distinct Channel_names each AFID maps to
  SELECT
    Final_URL_suffix_AFID,
    COUNT(DISTINCT Channel_name) AS channel_name_count
  FROM 
    afid_channel_name_mapping
  GROUP BY 
    Final_URL_suffix_AFID
  HAVING 
    COUNT(DISTINCT Channel_name) = 1
),

verification_52 AS (
  -- V52: AFIDs with only ONE Channel_name
  SELECT DISTINCT
    acm.Final_URL_suffix_AFID,
    acm.Channel_name,
    CAST(NULL AS STRING) AS Channel_type,
    'V52 - Single Channel_name Mapping' AS Verification_Type
  FROM 
    afid_channel_name_mapping acm
  INNER JOIN 
    afid_channel_name_count acc
  ON 
    acm.Final_URL_suffix_AFID = acc.Final_URL_suffix_AFID
),

afid_channel_type_mapping AS (
  -- Get distinct combinations of AFID and Channel_type
  SELECT DISTINCT
    Final_URL_suffix_AFID,
    Channel_type
  FROM 
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE 
    Final_URL_suffix_AFID IS NOT NULL 
    AND Final_URL_suffix_AFID != ''
),

afid_channel_type_count AS (
  -- Count how many distinct Channel_types each AFID maps to
  SELECT
    Final_URL_suffix_AFID,
    COUNT(DISTINCT Channel_type) AS channel_type_count
  FROM 
    afid_channel_type_mapping
  GROUP BY 
    Final_URL_suffix_AFID
  HAVING 
    COUNT(DISTINCT Channel_type) = 1
),

verification_53 AS (
  -- V53: AFIDs with only ONE Channel_type
  SELECT DISTINCT
    atm.Final_URL_suffix_AFID,
    CAST(NULL AS STRING) AS Channel_name,
    atm.Channel_type,
    'V53 - Single Channel_type Mapping' AS Verification_Type
  FROM 
    afid_channel_type_mapping atm
  INNER JOIN 
    afid_channel_type_count atc
  ON 
    atm.Final_URL_suffix_AFID = atc.Final_URL_suffix_AFID
)

-- Combine both verifications
SELECT * FROM verification_52
UNION ALL
SELECT * FROM verification_53
ORDER BY 
  Verification_Type,
  Final_URL_suffix_AFID;

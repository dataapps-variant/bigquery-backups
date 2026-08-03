-- job_id: scheduled_query_6a768cbe-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T03:36:04.829000+00:00
-- started: 2026-07-30T03:36:05.187000+00:00
-- ended: 2026-07-30T03:36:06.281000+00:00

-- =====================================================
-- VERIFICATION SQL #52 & #53 (Combined)
-- Purpose: Show AFIDs mapped with MORE THAN ONE Channel_name (V52)
--          and MORE THAN ONE Channel_type (V53)
-- Table: Ad_spend_data.Merged_Spend_Split_TBL
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Verification_53-54` AS

WITH afid_multi_channel_name AS (
  -- Find AFIDs with MORE THAN ONE Channel_name
  SELECT
    Final_URL_suffix_AFID
  FROM 
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE 
    Final_URL_suffix_AFID IS NOT NULL 
    AND Final_URL_suffix_AFID != ''
  GROUP BY 
    Final_URL_suffix_AFID
  HAVING 
    COUNT(DISTINCT Channel_name) > 1
),

afid_multi_channel_type AS (
  -- Find AFIDs with MORE THAN ONE Channel_type
  SELECT
    Final_URL_suffix_AFID
  FROM 
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE 
    Final_URL_suffix_AFID IS NOT NULL 
    AND Final_URL_suffix_AFID != ''
  GROUP BY 
    Final_URL_suffix_AFID
  HAVING 
    COUNT(DISTINCT Channel_type) > 1
),

problem_afids AS (
  -- Combine AFIDs that have issues with either Channel_name or Channel_type
  SELECT Final_URL_suffix_AFID FROM afid_multi_channel_name
  UNION DISTINCT
  SELECT Final_URL_suffix_AFID FROM afid_multi_channel_type
)

-- Final output: All distinct combinations for problem AFIDs
SELECT DISTINCT
  base.Final_URL_suffix_AFID,
  base.Channel_name,
  base.Channel_type
FROM 
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` base
INNER JOIN 
  problem_afids pa
ON 
  base.Final_URL_suffix_AFID = pa.Final_URL_suffix_AFID
ORDER BY 
  base.Final_URL_suffix_AFID,
  base.Channel_name,
  base.Channel_type;

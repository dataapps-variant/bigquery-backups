CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Decline_Reason_Final` AS

WITH source_data AS (
  -- Get distinct Decline_Reasons from source table
  SELECT DISTINCT Decline_Reason
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE Decline_Reason IS NOT NULL
),

-- Step 1: Try partial/contains match with Decline_Lookup
partial_match AS (
  SELECT 
    s.Decline_Reason,
    ARRAY_AGG(dl.Final_Category IGNORE NULLS LIMIT 1)[SAFE_OFFSET(0)] AS Partial_Final_Category
  FROM source_data s
  LEFT JOIN `variant-finance-data-project.Daedalus.Decline_Lookup` dl
    ON LOWER(s.Decline_Reason) LIKE CONCAT('%', LOWER(dl.Decline_Reason), '%')
  GROUP BY s.Decline_Reason
)

-- Step 2: If no partial match, fallback to exact match with Dim_Decline_Reasons
SELECT 
  pm.Decline_Reason,
  COALESCE(pm.Partial_Final_Category, ddr.Final_Category) AS Final_Category
FROM partial_match pm
LEFT JOIN `variant-finance-data-project.Daedalus.Dim_Decline_Reasons` ddr
  ON LOWER(pm.Decline_Reason) = LOWER(ddr.Decline_Reason)

-- job_id: scheduled_query_6a6eaec0-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T08:21:01.014000+00:00
-- started: 2026-07-29T08:21:01.398000+00:00
-- ended: 2026-07-29T08:21:14.364000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Decline_Reason_Final` AS

WITH source_data AS (
  SELECT DISTINCT Decline_Reason
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE Decline_Reason IS NOT NULL
),

-- Step 1: Try exact match with Dim_Decline_Reasons first
exact_match AS (
  SELECT 
    s.Decline_Reason,
    ddr.Final_Category AS Exact_Final_Category
  FROM source_data s
  LEFT JOIN `variant-finance-data-project.Daedalus.Dim_Decline_Reasons` ddr
    ON LOWER(s.Decline_Reason) = LOWER(ddr.Decline_Reason)
),

-- Step 2: If no exact match, fallback to partial/contains match with Decline_Lookup
final_categorized AS (
  SELECT 
    em.Decline_Reason,
    COALESCE(
      em.Exact_Final_Category,
      ARRAY_AGG(dl.Final_Category IGNORE NULLS LIMIT 1)[SAFE_OFFSET(0)]
    ) AS Final_Category
  FROM exact_match em
  LEFT JOIN `variant-finance-data-project.Daedalus.Decline_Lookup` dl
    ON em.Exact_Final_Category IS NULL
    AND LOWER(em.Decline_Reason) LIKE CONCAT('%', LOWER(dl.Decline_Reason), '%')
  GROUP BY em.Decline_Reason, em.Exact_Final_Category
)

-- Step 3: Look up Fault_Category from Final_Category
SELECT 
  fc.Decline_Reason,
  fc.Final_Category,
  fcc.Fault_Category
FROM final_categorized fc
LEFT JOIN (
  SELECT * FROM `variant-finance-data-project.Daedalus.Dim_Decline_Reason_Category_Classification`
  QUALIFY ROW_NUMBER() OVER (PARTITION BY LOWER(Final_Category) ORDER BY Final_Category) = 1
) fcc
  ON LOWER(fc.Final_Category) = LOWER(fcc.Final_Category)

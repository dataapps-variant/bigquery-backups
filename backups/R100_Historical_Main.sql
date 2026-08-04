CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_Historical_Main`
PARTITION BY activity_date
CLUSTER BY Input_ID, Plan_Code
AS
-- ============================================================
-- R100 Historical Table: grouped by Input_ID (one slice per input row)
-- Grain: Input_ID × Entity × Plan_Code × Trial_Type × cohort_date × activity_date × bc_number
-- ============================================================

WITH

-- Step 1: Base data with plan merge applied
base_data AS (
  SELECT
    src.Updated_Cust_ID,
    src.App_Name,
    src.AFID_CHANNEL,
    src.Spend_Country_Code_AFID,
    src.Date_of_Sale AS activity_date,
    DATE(src.Acquisition_Date_Time) AS cohort_date,
    src.Billing_Cycle_Updated AS bc_number,
    src.Order_Total_USD,
    COALESCE(map.Updated_Concat, src.Product_Name_Final) AS Plan_Code
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` AS src
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` AS map
    ON src.Product_Name_Final = map.Concat
  WHERE src.Updated_Cust_ID IS NOT NULL
    AND src.Date_of_Sale IS NOT NULL
    AND src.Acquisition_Date_Time IS NOT NULL
    AND src.Product_Name_Final IS NOT NULL
),

-- Step 2: Derive Trial_Type from merged Plan_Code
with_trial_type AS (
  SELECT
    *,
    UPPER(RIGHT(Plan_Code, 2)) AS Trial_Type
  FROM base_data
),

-- Step 3: For CT customers, determine their bucket (CT-JP or CT-Non-JP)
-- based on their FIRST order's country code. Cohort wins.
ct_customer_bucket AS (
  SELECT
    Updated_Cust_ID,
    Plan_Code,
    Trial_Type,
    CASE
      WHEN ARRAY_AGG(Spend_Country_Code_AFID ORDER BY activity_date ASC LIMIT 1)[OFFSET(0)] = 'JP'
      THEN 'CT-JP'
      ELSE 'CT-Non-JP'
    END AS ct_entity
  FROM with_trial_type
  WHERE App_Name = 'CT'
  GROUP BY Updated_Cust_ID, Plan_Code, Trial_Type
),

-- Step 4: Apply Entity logic across all rows
with_entity AS (
  SELECT
    t.Updated_Cust_ID,
    t.Plan_Code,
    t.Trial_Type,
    t.AFID_CHANNEL,
    t.Spend_Country_Code_AFID,
    t.cohort_date,
    t.activity_date,
    t.bc_number,
    t.Order_Total_USD,
    CASE
      WHEN t.App_Name = 'CT' THEN ct.ct_entity
      ELSE t.App_Name
    END AS Entity
  FROM with_trial_type AS t
  LEFT JOIN ct_customer_bucket AS ct
    ON t.Updated_Cust_ID = ct.Updated_Cust_ID
   AND t.Plan_Code = ct.Plan_Code
   AND t.Trial_Type = ct.Trial_Type
   AND t.App_Name = 'CT'
),

-- Step 5: Bring in input selection rules
-- One row per (Input_ID, Entity, Plan_Code) we want to process
-- AFID_Channel / Country_Code may be NULL (All) or comma-separated strings
input_rules AS (
  SELECT
    Input_ID,
    Entity,
    Plan_Code,
    AFID_Channel AS afid_filter_str,
    Country_Code AS country_filter_str
  FROM `variant-finance-data-project.R100.R100_Input_Selection`
  WHERE Inputs_to_Process = TRUE
),

-- Step 6: Join source rows with input rules
-- A source row matches if:
--   - Entity matches
--   - Plan_Code matches
--   - AFID matches (either filter is NULL = All, OR row's AFID is in the comma-separated list)
--   - Country matches (same logic)
-- Each matched row gets tagged with the Input_ID that picked it up.
filtered_data AS (
  SELECT
    r.Input_ID,
    e.Entity,
    e.Plan_Code,
    e.Trial_Type,
    e.cohort_date,
    e.activity_date,
    e.bc_number,
    e.Updated_Cust_ID,
    e.Order_Total_USD
  FROM with_entity AS e
  INNER JOIN input_rules AS r
    ON e.Entity = r.Entity
   AND e.Plan_Code = r.Plan_Code
  WHERE
    -- AFID filter: pass if filter is NULL (All) OR row's AFID is in the list
    (
      r.afid_filter_str IS NULL
      OR CAST(e.AFID_CHANNEL AS STRING) IN UNNEST(SPLIT(r.afid_filter_str, ','))
    )
    AND
    -- Country filter: same logic
    (
      r.country_filter_str IS NULL
      OR e.Spend_Country_Code_AFID IN UNNEST(SPLIT(r.country_filter_str, ','))
    )
),

-- Step 7: Compute cohort_size per (Input_ID, cohort)
cohort_sizes AS (
  SELECT
    Input_ID,
    Entity,
    Plan_Code,
    Trial_Type,
    cohort_date,
    COUNT(DISTINCT Updated_Cust_ID) AS cohort_size
  FROM filtered_data
  WHERE cohort_date = activity_date
  GROUP BY Input_ID, Entity, Plan_Code, Trial_Type, cohort_date
),

-- Step 8: Final aggregation to the table grain (grouped by Input_ID)
aggregated AS (
  SELECT
    Input_ID,
    Entity,
    Plan_Code,
    Trial_Type,
    cohort_date,
    activity_date,
    bc_number,
    COUNT(DISTINCT Updated_Cust_ID) AS user_count,
    SUM(Order_Total_USD) AS gross_revenue_usd
  FROM filtered_data
  GROUP BY Input_ID, Entity, Plan_Code, Trial_Type,
           cohort_date, activity_date, bc_number
)

SELECT
  a.Input_ID,
  a.Entity,
  a.Plan_Code,
  a.Trial_Type,
  a.cohort_date,
  a.activity_date,
  a.bc_number,
  a.user_count,
  a.gross_revenue_usd,
  cs.cohort_size,
  CURRENT_TIMESTAMP() AS loaded_at
FROM aggregated AS a
LEFT JOIN cohort_sizes AS cs
  ON a.Input_ID = cs.Input_ID
 AND a.cohort_date = cs.cohort_date;

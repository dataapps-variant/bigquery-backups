-- job_id: scheduled_query_6aa2250e-0000-2548-9a5c-30fd380f88f8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T08:15:02.950000+00:00
-- started: 2026-07-30T08:15:03.321000+00:00
-- ended: 2026-07-30T08:20:14.848000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Active_Users_List` AS

WITH

-- ============================
-- INPUT PARAMETER
-- ============================
app_input AS (
  SELECT 'EN' AS App_Name_Filter
  UNION ALL SELECT 'JF'
  UNION ALL SELECT 'PD'
  UNION ALL SELECT 'CL'
  UNION ALL SELECT 'CT'
  UNION ALL SELECT 'FS'
  UNION ALL SELECT 'MB'
),

-- ============================
-- DATE SPINE
-- ============================
date_series AS (
  SELECT date_value AS Date
  FROM UNNEST(
    GENERATE_DATE_ARRAY('2025-01-01', CURRENT_DATE())
  ) AS date_value
),

-- ============================
-- PLAN LEVEL ATTRIBUTES
-- Trial_Period and Reg_BC_Period are plan-level
-- ============================
plan_attributes AS (
  SELECT
    Product_Name_Final        AS Plan,
    ANY_VALUE(Trial_Period)   AS Trial_Period,
    ANY_VALUE(Reg_BC_Period)  AS Reg_BC_Period
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name IN (SELECT App_Name_Filter FROM app_input)
    AND Product_Name_Final IS NOT NULL
    AND Trial_Type != 'SS'
  GROUP BY Product_Name_Final
),

-- ============================
-- PLAN + AFID_CHANNEL COMBINATIONS
-- CT is split into CT-JP and CT-Non-JP
-- Non-CT apps get NULL country
-- ============================
plan_afid_combinations AS (
  -- Non-CT apps
  SELECT DISTINCT
    Product_Name_Final        AS Plan,
    App_Name                  AS App_Name,
    AFID_CHANNEL,
    CAST(NULL AS STRING) AS Country
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name IN (SELECT App_Name_Filter FROM app_input)
    AND App_Name != 'CT'
    AND Product_Name_Final IS NOT NULL
    AND AFID_CHANNEL IS NOT NULL

  UNION ALL

  -- CT-JP
  SELECT DISTINCT
    Product_Name_Final        AS Plan,
    'CT-JP'                   AS App_Name,
    AFID_CHANNEL,
    'JP'                      AS Country
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Spend_Country_Code_AFID = 'JP'
    AND Product_Name_Final IS NOT NULL
    AND AFID_CHANNEL IS NOT NULL

  UNION ALL

  -- CT-Non-JP
  SELECT DISTINCT
    Product_Name_Final        AS Plan,
    'CT-Non-JP'               AS App_Name,
    AFID_CHANNEL,
    'Non-JP'                  AS Country
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND (Spend_Country_Code_AFID != 'JP' OR Spend_Country_Code_AFID IS NULL)
    AND Product_Name_Final IS NOT NULL
    AND AFID_CHANNEL IS NOT NULL
),

-- ============================
-- BC SPINE
-- Always two rows: BC=0 and BC=1
-- ============================
bc_spine AS (
  SELECT 0 AS BC
  UNION ALL
  SELECT 1 AS BC
),

-- ============================
-- BASE DIMENSIONS
-- Date x Plan x App_Name x Country x AFID_CHANNEL x BC (always 0 and 1)
-- ============================
base_dimensions AS (
  SELECT
    ds.Date,
    pac.Plan,
    pac.App_Name,
    pac.Country,
    pac.AFID_CHANNEL,
    bc.BC,
    pa.Trial_Period,
    pa.Reg_BC_Period,
    CASE
      WHEN bc.BC = 0
        THEN DATE_SUB(ds.Date, INTERVAL (pa.Trial_Period + 29) DAY)
      ELSE
        DATE_SUB(ds.Date, INTERVAL (pa.Reg_BC_Period + 29) DAY)
    END AS Start_Date
  FROM date_series ds
  CROSS JOIN plan_afid_combinations pac
  CROSS JOIN bc_spine bc
  INNER JOIN plan_attributes pa
    ON pa.Plan = pac.Plan
)

-- ============================
-- FINAL OUTPUT
-- BC=0 row → counts only trial orders (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
-- BC=1 row → counts all other orders
-- CT-JP / CT-Non-JP → also matched on Spend_Country_Code_AFID
-- ============================
SELECT
  bd.Date,
  bd.Plan                             AS Product_Name_Final,
  bd.App_Name,
  bd.Country,
  bd.AFID_CHANNEL,
  bd.BC,
  bd.Start_Date,
  COUNT(DISTINCT s.Updated_Cust_ID)   AS Active_Users

FROM base_dimensions bd
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
  ON  s.Product_Name_Final  = bd.Plan
  AND s.AFID_CHANNEL        = bd.AFID_CHANNEL
  -- App_Name match: map CT-JP/CT-Non-JP back to CT for source table
  AND CASE
        WHEN bd.App_Name IN ('CT-JP', 'CT-Non-JP') THEN s.App_Name = 'CT'
        ELSE s.App_Name = bd.App_Name
      END
  -- Country match: only for CT splits
  AND CASE
        WHEN bd.App_Name = 'CT-JP'
          THEN s.Spend_Country_Code_AFID = 'JP'
        WHEN bd.App_Name = 'CT-Non-JP'
          THEN (s.Spend_Country_Code_AFID != 'JP' OR s.Spend_Country_Code_AFID IS NULL)
        ELSE TRUE
      END
  AND s.Date_of_Sale        BETWEEN bd.Start_Date AND bd.Date
  AND s.Final_Order_Status  != 6
  AND s.Is_Chargeback       != '1'
  AND CASE
        WHEN bd.BC = 0
          THEN s.Trial_Type != 'NT' AND s.Billing_Cycle_Updated = 0
        ELSE
          NOT (s.Trial_Type != 'NT' AND s.Billing_Cycle_Updated = 0)
      END

GROUP BY
  bd.Date,
  bd.Plan,
  bd.App_Name,
  bd.Country,
  bd.AFID_CHANNEL,
  bd.BC,
  bd.Start_Date

ORDER BY
  bd.Date,
  bd.Plan,
  bd.AFID_CHANNEL,
  bd.BC;

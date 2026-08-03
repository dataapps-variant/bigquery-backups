-- job_id: scheduled_query_6a9b23e7-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T08:15:01.183000+00:00
-- started: 2026-08-02T08:15:01.452000+00:00
-- ended: 2026-08-02T08:15:16.563000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Retry_Engine_Users_List` AS

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
  UNION ALL SELECT 'MB'
  UNION ALL SELECT 'FS'
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
-- CT split into CT-JP and CT-Non-JP
-- ============================
plan_afid_combinations AS (
  -- Non-CT apps
  SELECT DISTINCT
    Product_Name_Final          AS Plan,
    App_Name                    AS App_Name,
    AFID_CHANNEL,
    CAST(NULL AS STRING)        AS Country
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name IN (SELECT App_Name_Filter FROM app_input)
    AND App_Name != 'CT'
    AND Product_Name_Final IS NOT NULL
    AND AFID_CHANNEL IS NOT NULL

  UNION ALL

  -- CT-JP
  SELECT DISTINCT
    Product_Name_Final          AS Plan,
    'CT-JP'                     AS App_Name,
    AFID_CHANNEL,
    'JP'                        AS Country
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Spend_Country_Code_AFID = 'JP'
    AND Product_Name_Final IS NOT NULL
    AND AFID_CHANNEL IS NOT NULL

  UNION ALL

  -- CT-Non-JP
  SELECT DISTINCT
    Product_Name_Final          AS Plan,
    'CT-Non-JP'                 AS App_Name,
    AFID_CHANNEL,
    'Non-JP'                    AS Country
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND (Spend_Country_Code_AFID != 'JP' OR Spend_Country_Code_AFID IS NULL)
    AND Product_Name_Final IS NOT NULL
    AND AFID_CHANNEL IS NOT NULL
),

-- ============================
-- BC SPINE
-- ============================
bc_spine AS (
  SELECT 0 AS BC
  UNION ALL
  SELECT 1 AS BC
),

-- ============================
-- BASE DIMENSIONS
-- Date x Plan x App_Name x Country x AFID_CHANNEL x BC
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
    -- Start_Date: same as Active_Users_List
    CASE
      WHEN bc.BC = 0
        THEN DATE_SUB(ds.Date, INTERVAL (pa.Trial_Period + 29) DAY)
      ELSE
        DATE_SUB(ds.Date, INTERVAL (pa.Reg_BC_Period + 29) DAY)
    END AS Start_Date,
    -- End_Date: Date - period + 1
    CASE
      WHEN bc.BC = 0
        THEN DATE_SUB(ds.Date, INTERVAL (pa.Trial_Period - 1) DAY)
      ELSE
        DATE_SUB(ds.Date, INTERVAL (pa.Reg_BC_Period - 1) DAY)
    END AS End_Date
  FROM date_series ds
  CROSS JOIN plan_afid_combinations pac
  CROSS JOIN bc_spine bc
  INNER JOIN plan_attributes pa
    ON pa.Plan = pac.Plan
),

-- ============================
-- SUBS USERS
-- Qualifying orders between Start_Date and End_Date
-- With status and chargeback filters
-- ============================
subs_users AS (
  SELECT
    bd.Date,
    bd.Plan,
    bd.App_Name,
    bd.Country,
    bd.AFID_CHANNEL,
    bd.BC,
    bd.Start_Date,
    bd.End_Date,
    s.Updated_Cust_ID,
    MIN(s.Date_of_Sale) AS Qualifying_Order_Date
  FROM base_dimensions bd
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON  s.Product_Name_Final  = bd.Plan
    AND s.AFID_CHANNEL        = bd.AFID_CHANNEL
    AND CASE
          WHEN bd.App_Name IN ('CT-JP', 'CT-Non-JP') THEN s.App_Name = 'CT'
          ELSE s.App_Name = bd.App_Name
        END
    AND CASE
          WHEN bd.App_Name = 'CT-JP'
            THEN s.Spend_Country_Code_AFID = 'JP'
          WHEN bd.App_Name = 'CT-Non-JP'
            THEN (s.Spend_Country_Code_AFID != 'JP' OR s.Spend_Country_Code_AFID IS NULL)
          ELSE TRUE
        END
    AND s.Date_of_Sale        BETWEEN bd.Start_Date AND bd.End_Date
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
    bd.Start_Date,
    bd.End_Date,
    s.Updated_Cust_ID
),

-- ============================
-- EXCL SUBS USERS
-- Subs users who have any follow-up order
-- Same App, any Plan, no status/chargeback filter
-- ============================
excl_subs_users AS (
  SELECT DISTINCT
    su.Date,
    su.Plan,
    su.App_Name,
    su.Country,
    su.AFID_CHANNEL,
    su.BC,
    su.Updated_Cust_ID
  FROM subs_users su
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` f
    ON  f.Updated_Cust_ID   = su.Updated_Cust_ID
    AND CASE
          WHEN su.App_Name IN ('CT-JP', 'CT-Non-JP') THEN f.App_Name = 'CT'
          ELSE f.App_Name = su.App_Name
        END
    AND f.Date_of_Sale      > su.Qualifying_Order_Date
    AND f.Date_of_Sale      <= su.Date
)

-- ============================
-- FINAL OUTPUT
-- ============================
SELECT
  bd.Date,
  bd.Plan                                         AS Product_Name_Final,
  bd.App_Name,
  bd.Country,
  bd.AFID_CHANNEL,
  bd.BC,
  bd.Start_Date,
  bd.End_Date,
  COUNT(DISTINCT su.Updated_Cust_ID)              AS Subs,
  COUNT(DISTINCT eu.Updated_Cust_ID)              AS Excl_Subs,
  COUNT(DISTINCT su.Updated_Cust_ID)
    - COUNT(DISTINCT eu.Updated_Cust_ID)          AS Retry_Users

FROM base_dimensions bd
LEFT JOIN subs_users su
  ON  su.Date         = bd.Date
  AND su.Plan         = bd.Plan
  AND su.App_Name     = bd.App_Name
  AND su.Country      IS NOT DISTINCT FROM bd.Country
  AND su.AFID_CHANNEL = bd.AFID_CHANNEL
  AND su.BC           = bd.BC
LEFT JOIN excl_subs_users eu
  ON  eu.Date         = su.Date
  AND eu.Plan         = su.Plan
  AND eu.App_Name     = su.App_Name
  AND eu.Country      IS NOT DISTINCT FROM su.Country
  AND eu.AFID_CHANNEL = su.AFID_CHANNEL
  AND eu.BC           = su.BC
  AND eu.Updated_Cust_ID = su.Updated_Cust_ID

GROUP BY
  bd.Date,
  bd.Plan,
  bd.App_Name,
  bd.Country,
  bd.AFID_CHANNEL,
  bd.BC,
  bd.Start_Date,
  bd.End_Date

ORDER BY
  bd.Date,
  bd.Plan,
  bd.AFID_CHANNEL,
  bd.BC;

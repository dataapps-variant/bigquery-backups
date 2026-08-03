-- job_id: scheduled_query_6a8ab00a-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T08:15:01.291000+00:00
-- started: 2026-08-02T08:15:01.595000+00:00
-- ended: 2026-08-02T08:15:14.549000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Involuntary_Ended_Subscriptions` AS

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
-- SS plans excluded
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
    -- Start_Date: older boundary of qualifying window
    CASE
      WHEN bc.BC = 0
        THEN DATE_SUB(ds.Date, INTERVAL 64 DAY)
      ELSE
        DATE_SUB(ds.Date, INTERVAL 87 DAY)
    END AS Start_Date,
    -- End_Date: newer boundary of qualifying window
    CASE
      WHEN bc.BC = 0
        THEN DATE_SUB(ds.Date, INTERVAL 36 DAY)
      ELSE
        DATE_SUB(ds.Date, INTERVAL 59 DAY)
    END AS End_Date
  FROM date_series ds
  CROSS JOIN plan_afid_combinations pac
  CROSS JOIN bc_spine bc
  INNER JOIN plan_attributes pa
    ON pa.Plan = pac.Plan
),

-- ============================
-- QUALIFYING ORDERS
-- Latest eligible order per customer within [Start_Date, End_Date]
-- Same plan, eligible orders only (no refund/chargeback)
-- ============================
qualifying_orders AS (
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
    MAX(s.Date_of_Sale) AS Qualifying_Order_Date
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
-- SUBSEQUENT ORDERS CHECK
-- Customers who have ANY order (no status filter)
-- in same plan after Qualifying_Order_Date up to bd.Date
-- ============================
has_subsequent_order AS (
  SELECT DISTINCT
    qo.Date,
    qo.Plan,
    qo.App_Name,
    qo.Country,
    qo.AFID_CHANNEL,
    qo.BC,
    qo.Updated_Cust_ID
  FROM qualifying_orders qo
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON  s.Updated_Cust_ID     = qo.Updated_Cust_ID
    AND s.Product_Name_Final  = qo.Plan
    AND CASE
          WHEN qo.App_Name IN ('CT-JP', 'CT-Non-JP') THEN s.App_Name = 'CT'
          ELSE s.App_Name = qo.App_Name
        END
    AND s.Date_of_Sale        > qo.Qualifying_Order_Date
    AND s.Date_of_Sale        <= qo.Date
)

-- ============================
-- FINAL OUTPUT
-- Involuntary_Ended_Subs = qualifying customers with no subsequent order
-- ============================
SELECT
  bd.Date,
  bd.Plan                                               AS Product_Name_Final,
  bd.App_Name,
  bd.Country,
  bd.AFID_CHANNEL,
  bd.BC,
  bd.Start_Date,
  bd.End_Date,
  COUNT(DISTINCT CASE
    WHEN hso.Updated_Cust_ID IS NULL
    THEN qo.Updated_Cust_ID
  END)                                                  AS Involuntary_Ended_Subs

FROM base_dimensions bd
LEFT JOIN qualifying_orders qo
  ON  qo.Date         = bd.Date
  AND qo.Plan         = bd.Plan
  AND qo.App_Name     = bd.App_Name
  AND qo.Country      IS NOT DISTINCT FROM bd.Country
  AND qo.AFID_CHANNEL = bd.AFID_CHANNEL
  AND qo.BC           = bd.BC
LEFT JOIN has_subsequent_order hso
  ON  hso.Date         = qo.Date
  AND hso.Plan         = qo.Plan
  AND hso.App_Name     = qo.App_Name
  AND hso.Country      IS NOT DISTINCT FROM qo.Country
  AND hso.AFID_CHANNEL = qo.AFID_CHANNEL
  AND hso.BC           = qo.BC
  AND hso.Updated_Cust_ID = qo.Updated_Cust_ID

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

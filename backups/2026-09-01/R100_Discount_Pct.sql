CREATE OR REPLACE TABLE `variant-finance-data-project.demo_practise.R100_Discount_Pct` AS

WITH plan_map AS (
  SELECT DISTINCT Input_ID, Entity, Plan_Code, Country_Code
  FROM `variant-finance-data-project.R100.R100_Inputs_Full`
),

plan_countries_base AS (
  SELECT
    Input_ID,
    Entity,
    Plan_Code,
    TRIM(country) AS Country
  FROM plan_map,
  UNNEST(
    CASE WHEN Country_Code IS NULL OR TRIM(Country_Code) = ''
         THEN [CAST(NULL AS STRING)]
         ELSE SPLIT(Country_Code, ',')
    END
  ) AS country
),

-- countries already carved out into their own specific-country row, per Plan_Code
-- (so the blank/catch-all row for that same Plan_Code excludes them)
plan_code_carved_countries AS (
  SELECT Plan_Code, ARRAY_AGG(DISTINCT Country) AS Carved_Countries
  FROM plan_countries_base
  WHERE Country IS NOT NULL
  GROUP BY Plan_Code
),

-- routing-only signal: when an Input_ID's Country_Code is blank, does its
-- Entity name indicate it should only ever receive JP orders, or only
-- ever receive non-JP orders? Used ONLY to decide which Input_ID an order
-- counts toward when two blank-Country_Code Input_IDs share a Plan_Code.
-- This never appears in or changes the Country column shown in the output.
plan_entity_jp_type AS (
  SELECT
    Input_ID,
    Plan_Code,
    CASE
      WHEN UPPER(Entity) LIKE '%NON-JP%' OR UPPER(Entity) LIKE '%NON_JP%' OR UPPER(Entity) LIKE '%NONJP%' THEN 'NON_JP_ENTITY'
      WHEN UPPER(Entity) LIKE '%JP%' THEN 'JP_ENTITY'
      ELSE NULL
    END AS Entity_JP_Type
  FROM plan_map
),

plan_countries AS (
  SELECT
    pcb.Input_ID,
    pcb.Entity,
    pcb.Plan_Code,
    pcb.Country,
    ccc.Carved_Countries,
    ejt.Entity_JP_Type
  FROM plan_countries_base pcb
  LEFT JOIN plan_code_carved_countries ccc
    ON pcb.Plan_Code = ccc.Plan_Code
  LEFT JOIN plan_entity_jp_type ejt
    ON pcb.Input_ID = ejt.Input_ID AND pcb.Plan_Code = ejt.Plan_Code
),

-- raw product codes rolling up into each Plan_Code:
-- (a) Plan_Code itself — self-mapped plans + already-renamed products
-- (b) any Concat whose Updated_Concat = Plan_Code — legacy pre-reassignment codes
plan_raw_codes AS (
  SELECT DISTINCT Plan_Code AS Raw_Code, Plan_Code
  FROM `variant-finance-data-project.R100.R100_Inputs_Full`

  UNION DISTINCT

  SELECT DISTINCT pm.Concat AS Raw_Code, pm.Updated_Concat AS Plan_Code
  FROM `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` pm
  WHERE pm.Updated_Concat IN (
    SELECT DISTINCT Plan_Code
    FROM `variant-finance-data-project.R100.R100_Inputs_Full`
  )
),

orders_mapped AS (
  SELECT
    u.Spend_Country_Code_AFID AS Country,
    u.Updated_Cust_ID,
    u.Plan_Price_Net_of_Tax_USD,
    u.Order_Price_Net_of_Tax_USD,
    prc.Plan_Code
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` u
  JOIN plan_raw_codes prc
    ON u.Product_Name_Final = prc.Raw_Code
  WHERE u.Date_of_Sale BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
                            AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
),

orders_final AS (
  SELECT
    pc.Input_ID,
    pc.Entity,
    pc.Plan_Code,
    pc.Country AS Plan_Country,
    SUM(om.Plan_Price_Net_of_Tax_USD)  AS Plan_Price,
    SUM(om.Order_Price_Net_of_Tax_USD) AS Order_Price
  FROM orders_mapped om
  JOIN plan_countries pc
    ON om.Plan_Code = pc.Plan_Code
   AND (
     (pc.Country IS NOT NULL AND om.Country = pc.Country)
     OR
     (
       pc.Country IS NULL
       AND (pc.Carved_Countries IS NULL OR om.Country NOT IN UNNEST(pc.Carved_Countries))
       AND (
         pc.Entity_JP_Type IS NULL
         OR (pc.Entity_JP_Type = 'JP_ENTITY' AND om.Country = 'JP')
         OR (pc.Entity_JP_Type = 'NON_JP_ENTITY' AND (om.Country IS NULL OR om.Country != 'JP'))
       )
     )
   )
  GROUP BY pc.Input_ID, pc.Entity, pc.Plan_Code, pc.Country
),

-- collapse the per-country rows back into one row per Plan_Code,
-- joining the countries into a single comma-separated string
rolled_up_by_plan AS (
  SELECT
    Input_ID,
    Entity,
    Plan_Code,
    STRING_AGG(DISTINCT Plan_Country, ', ' ORDER BY Plan_Country) AS Country,
    SUM(Plan_Price)  AS Plan_Price,
    SUM(Order_Price) AS Order_Price
  FROM orders_final
  GROUP BY Input_ID, Entity, Plan_Code
),

discounts_calc AS (
  SELECT
    Input_ID,
    Entity,
    Plan_Code,
    Country,
    Plan_Price,
    Order_Price,
    SAFE_DIVIDE(Plan_Price - Order_Price, Plan_Price) AS Raw_Discount_Pct
  FROM rolled_up_by_plan
)

SELECT
  d.Input_ID,
  d.Entity,
  d.Plan_Code AS Plan_Name,
  d.Country,
  ROUND(d.Plan_Price, 2)  AS Plan_Price,
  ROUND(d.Order_Price, 2) AS Order_Price,
  CASE
    WHEN d.Raw_Discount_Pct IS NULL THEN NULL
    WHEN d.Raw_Discount_Pct < 0 THEN FORMAT("%.2f%%", 0.0)
    ELSE FORMAT("%.2f%%", d.Raw_Discount_Pct * 100)
  END AS Discounts_Pct,
  CASE
    WHEN d.Raw_Discount_Pct IS NULL THEN 'N/A'
    WHEN d.Raw_Discount_Pct < 0 THEN 'Yes'
    ELSE 'No'
  END AS Flag,
  CURRENT_TIMESTAMP() AS Loaded_At,
  CONCAT(
    FORMAT_DATE('%Y-%m-%d', DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)),
    ' to ',
    FORMAT_DATE('%Y-%m-%d', DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))
  ) AS Discount_Calculation_Date_Range
FROM discounts_calc d
ORDER BY d.Entity ASC;

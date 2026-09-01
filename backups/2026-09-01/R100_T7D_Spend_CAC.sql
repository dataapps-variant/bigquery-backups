CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_T7D_Spend_CAC` AS

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
-- NOTE: kept keyed by Plan_Code only (not Input_ID) — this must see carve-outs 
-- across ALL Input_IDs sharing a Plan_Code to correctly exclude them 
plan_code_carved_countries AS ( 
  SELECT Plan_Code, ARRAY_AGG(DISTINCT Country) AS Carved_Countries 
  FROM plan_countries_base 
  WHERE Country IS NOT NULL 
  GROUP BY Plan_Code 
), 
 
plan_countries AS ( 
  SELECT 
    pcb.Input_ID, 
    pcb.Entity, 
    pcb.Plan_Code, 
    pcb.Country, 
    ccc.Carved_Countries 
  FROM plan_countries_base pcb 
  LEFT JOIN plan_code_carved_countries ccc 
    ON pcb.Plan_Code = ccc.Plan_Code 
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
    SELECT DISTINCT Plan_Code FROM `variant-finance-data-project.R100.R100_Inputs_Full` 
  ) 
), 
 
spend_mapped AS ( 
  SELECT 
    s.Country, 
    s.allocated_spend, 
    prc.Plan_Code 
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` s 
  JOIN plan_raw_codes prc 
    ON s.Product_Name_final = prc.Raw_Code 
  WHERE s.Date BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) 
                    AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) 
), 
 
spend_final AS ( 
  SELECT 
    pc.Input_ID, 
    pc.Entity, 
    pc.Plan_Code, 
    pc.Country AS Plan_Country, 
    SUM(sm.allocated_spend) AS Total_Spend 
  FROM spend_mapped sm 
  JOIN plan_countries pc 
    ON sm.Plan_Code = pc.Plan_Code 
   AND ( 
     (pc.Country IS NOT NULL AND sm.Country = pc.Country) 
     OR 
     (pc.Country IS NULL AND (pc.Carved_Countries IS NULL OR sm.Country NOT IN UNNEST(pc.Carved_Countries))) 
   ) 
  GROUP BY pc.Input_ID, pc.Entity, pc.Plan_Code, pc.Country 
), 
 
-- USERS: BC0 (new) for regular plans; for NT (no-trial) plans use Billing_Cycle_Updated = 1 
users_mapped AS ( 
  SELECT 
    u.Spend_Country_Code_AFID AS Country, 
    u.Updated_Cust_ID, 
    prc.Plan_Code 
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` u 
  JOIN plan_raw_codes prc 
    ON u.Product_Name_Final = prc.Raw_Code 
  WHERE u.Date_of_Sale BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) 
                            AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) 
    AND ( 
      (prc.Plan_Code LIKE '%NT%' AND u.Billing_Cycle_Updated = 1) 
      OR 
      (prc.Plan_Code NOT LIKE '%NT%' AND SAFE_CAST(u.Billing_Cycle AS INT64) = 0) 
    ) 
), 
 
users_final AS ( 
  SELECT 
    pc.Input_ID, 
    pc.Entity, 
    pc.Plan_Code, 
    pc.Country AS Plan_Country, 
    COUNT(DISTINCT um.Updated_Cust_ID) AS Total_Users 
  FROM users_mapped um 
  JOIN plan_countries pc 
    ON um.Plan_Code = pc.Plan_Code 
   AND ( 
     (pc.Country IS NOT NULL AND um.Country = pc.Country) 
     OR 
     (pc.Country IS NULL AND (pc.Carved_Countries IS NULL OR um.Country NOT IN UNNEST(pc.Carved_Countries))) 
   ) 
  GROUP BY pc.Input_ID, pc.Entity, pc.Plan_Code, pc.Country 
), 
 
joined AS ( 
  SELECT 
    COALESCE(s.Input_ID, u.Input_ID) AS Input_ID, 
    COALESCE(s.Entity, u.Entity) AS Entity, 
    COALESCE(s.Plan_Code, u.Plan_Code) AS Plan_Code, 
    COALESCE(s.Plan_Country, u.Plan_Country) AS Country, 
    COALESCE(s.Total_Spend, 0) AS Total_Spend, 
    COALESCE(u.Total_Users, 0) AS Total_Users 
  FROM spend_final s 
  FULL OUTER JOIN users_final u 
    ON s.Input_ID = u.Input_ID 
   AND s.Entity = u.Entity 
   AND s.Plan_Code = u.Plan_Code 
   AND COALESCE(s.Plan_Country,'ALL') = COALESCE(u.Plan_Country,'ALL') 
), 
 
rolled_up AS ( 
  SELECT 
    j.Input_ID, 
    ANY_VALUE(j.Entity) AS Entity, 
    j.Plan_Code, 
    ROUND(SUM(j.Total_Spend), 2) AS Total_Spend,
    SUM(j.Total_Users) AS Total_Users 
  FROM joined j 
  GROUP BY j.Input_ID, j.Plan_Code 
) 
 
SELECT 
  DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS Report_Date, 
  r.Input_ID, 
  r.Entity, 
  r.Plan_Code AS Plan_Name, 
  pm.Country_Code AS Country, 
  r.Total_Spend AS Total_7Days_Spend, 
  r.Total_Users AS Total_7Days_Users, 
  ROUND(r.Total_Spend / 7, 2) AS Avg_Daily_Spend_7D, 
  ROUND(r.Total_Users / 7, 0) AS Avg_Daily_Users_7D, 
  ROUND(SAFE_DIVIDE(r.Total_Spend, r.Total_Users), 2) AS CAC, 
  CURRENT_TIMESTAMP() AS Loaded_At, 
  CONCAT( 
    FORMAT_DATE('%Y-%m-%d', DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)), 
    ' to ', 
    FORMAT_DATE('%Y-%m-%d', DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)) 
  ) AS CAC_Calculation_Date_Range 
FROM rolled_up r 
LEFT JOIN plan_map pm 
  ON r.Input_ID = pm.Input_ID 
ORDER BY Total_7Days_Spend DESC

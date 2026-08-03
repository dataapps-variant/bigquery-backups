-- job_id: scheduled_query_6ab6f41e-0000-2812-a002-34c7e9482e57
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T17:37:03.761000+00:00
-- started: 2026-08-02T17:37:04.932000+00:00
-- ended: 2026-08-02T17:37:21.176000+00:00

-- Create the new split spend view table with country-aware allocation
-- This redistributes daily spend data across products based on allocation rules
-- Priority: Country-specific allocation > Generic allocation (when country_code is blank)

CREATE OR REPLACE Table `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` AS
WITH ranked_matches AS (
  SELECT 
    -- All original columns from base table
    base.Channel_name,
    base.Date,
    base.Channel_type,
    base.Channel_code,
    base.App_name,  -- Keep original for JOIN and calculation
    base.Final_URL_suffix_AFID,
    base.Country,
    base.Amount,
    base.Source,
    
    -- Additional columns from dimension table
    dim.Product_Name_final,
    dim.Allocation,
    dim.Country_code,  -- Added for debugging/visibility
    
    -- Calculated allocated spend column
    base.Amount * dim.Allocation AS allocated_spend,
    
    -- Ranking to prioritize country-specific matches and highest Start_Date
    RANK() OVER (
      PARTITION BY 
        base.Channel_name, 
        base.Date, 
        base.Channel_type, 
        base.Channel_code, 
        base.App_name, 
        base.Final_URL_suffix_AFID, 
        base.Country, 
        base.Source
      ORDER BY 
        -- First priority: Country-specific matches (Country_code is NOT NULL/blank and matches)
        CASE 
          WHEN dim.Country_code IS NOT NULL 
               AND dim.Country_code != '' 
               AND dim.Country_code = base.Country THEN 0  -- Country-specific match
          WHEN dim.Country_code IS NULL OR dim.Country_code = '' THEN 1  -- Generic allocation
          ELSE 2  -- Country_code exists but doesn't match
        END,
        -- Second priority: Most recent Start_Date
        dim.Start_Date DESC
    ) as match_rank
    
  FROM 
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated` base
  INNER JOIN 
    `variant-finance-data-project.Ad_spend_data.Dim_spend_split` dim
  ON 
    -- Match App names
    base.App_name = dim.App_Name
    -- Ensure date falls within the valid range
    AND base.Date >= dim.Start_Date
    AND base.Date <= dim.End_Date
    -- Country matching logic: Either country-specific match OR generic (null/blank) allocation
    AND (
      (dim.Country_code IS NOT NULL 
       AND dim.Country_code != '' 
       AND base.Country = dim.Country_code)  -- Country-specific
      OR (dim.Country_code IS NULL OR dim.Country_code = '')  -- Generic allocation
    )
),

intermediate_result AS (
  -- STEP 1: Apply transformation and rename to App_Name_temp
  SELECT 
    Channel_name,
    Date,
    Channel_type,
    Channel_code,
    
    -- Transform and rename to intermediate name
    CASE 
      WHEN App_name = 'CT' AND Country = 'JP' THEN 'CT-JP'
      WHEN App_name = 'CT' AND Country != 'JP' THEN 'CT-Non-JP'
      WHEN App_name = 'CT' AND Country IS NULL THEN 'CT-Non-JP'
      ELSE App_name  -- Keep original for all other apps
    END AS App_Name_temp,  -- First rename to temp name
    
    Final_URL_suffix_AFID,
    Country,
    Amount,
    Source,
    Product_Name_final,
    Allocation,
    allocated_spend
  FROM 
    ranked_matches
  WHERE 
    match_rank = 1
)

-- STEP 2: Final SELECT to rename App_Name_temp to App_Name and add Product_Name_Final_Merged
SELECT 
  ir.Channel_name,
  ir.Date,
  ir.Channel_type,
  ir.Channel_code,
  ir.App_Name_temp AS `App_Name`,  -- Final rename to App_Name
  ir.Final_URL_suffix_AFID,
  ir.Country,
  ir.Amount,
  ir.Source,
  ir.Product_Name_final,
  ir.Allocation,
  ir.allocated_spend,
  
  -- NEW COLUMN: Product_Name_Final_Merged
  COALESCE(vpu_dim.Product_Name_Final_Merged, ir.Product_Name_final) AS Product_Name_Final_Merged

FROM 
  intermediate_result ir
LEFT JOIN 
  `variant-finance-data-project.VPU.VPU_Dim_MergedPlansDetails` vpu_dim
  ON ir.Product_Name_final = vpu_dim.Product_Name_final
  AND ir.Date >= vpu_dim.Start_Date
  AND ir.Date <= vpu_dim.End_Date
ORDER BY 
  ir.Date, ir.App_Name_temp, ir.Product_Name_final;

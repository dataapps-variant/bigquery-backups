CREATE VIEW `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Split`
AS WITH ranked_matches AS (
  SELECT 
    -- All original columns from base table
    base.Channel_name,
    base.Date,
    base.Channel_type,
    base.Channel_code,
    base.App_name,
    base.Final_URL_suffix_AFID,
    base.Country,
    base.Amount,
    base.Source,
    
    -- Additional columns from dimension table
    dim.Product_Name_final,
    dim.Allocation,
    
    -- Calculated allocated spend column
    base.Amount * dim.Allocation AS allocated_spend,
    
    -- Ranking to identify records with highest Start_Date for each base record
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
      ORDER BY dim.Start_Date DESC
    ) as start_date_rank
    
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
)

-- Final result: Keep only records with highest Start_Date (rank = 1)
-- If multiple records have same highest Start_Date, all will be included
SELECT 
  Channel_name,
  Date,
  Channel_type,
  Channel_code,
  App_name,
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
  start_date_rank = 1
ORDER BY 
  Date, App_name, Product_Name_final;

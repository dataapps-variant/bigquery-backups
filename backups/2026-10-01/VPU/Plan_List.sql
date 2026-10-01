-- Create table: variant-finance-data-project.VPU.Plan_List
-- This table contains distinct Product_Name_Final where we had any user in last 90 days
-- Products with both JP and Non-JP will have 2 separate rows

CREATE OR REPLACE TABLE `variant-finance-data-project.VPU.Plan_List` AS

WITH config AS (
  SELECT DATE('2025-01-01') AS start_date  -- Change this date as needed
)

SELECT 
    main.Product_Name_Final,
    main.Entity_Name,
    main.App_Name,
    main.Trial_Type,
    main.Trial_Period,
    main.Currency,
    MIN(main.Trial_Price) AS Trial_Price,
    MIN(dim.Product_Price) AS Regular_Price,
    
    -- Country_Code: will create separate rows for JP and Non-JP
    CASE 
        WHEN main.App_Name = 'CT' THEN 
            CASE 
                WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                ELSE 'Non-JP'
            END
        ELSE ''
    END AS Country_Code
    
FROM 
    `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` main
LEFT JOIN 
    `variant-finance-data-project.Sticky_Data.Sticky_Dim_Product` dim
    ON CONCAT(dim.Entity, dim.Product_Name_updated) = CONCAT(main.Entity_Name, SUBSTR(main.Product_Name_Final, 3, LENGTH(main.Product_Name_Final) - 4))
CROSS JOIN
    config
WHERE 
    main.Date_of_Sale >= config.start_date  -- Using start_date instead of interval
    AND main.Product_Name_Final IS NOT NULL
    AND main.Product_Name_Final != ''
    AND RIGHT(main.Product_Name_Final, 2) != 'SS'
    AND main.Billing_Cycle_Updated BETWEEN 0 AND 4
GROUP BY 
    main.Product_Name_Final,
    main.Entity_Name,
    main.App_Name,
    main.Trial_Type,
    main.Trial_Period,
    main.Currency,
    -- Add the derived Country_Code to GROUP BY
    CASE 
        WHEN main.App_Name = 'CT' THEN 
            CASE 
                WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                ELSE 'Non-JP'
            END
        ELSE ''
    END
ORDER BY 
    main.Product_Name_Final,
    main.Entity_Name,
    main.App_Name,
    main.Currency,
    Country_Code;

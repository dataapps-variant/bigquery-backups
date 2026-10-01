CREATE OR REPLACE PROCEDURE `variant-finance-data-project`.icarus_sticky.proc_Plan_List()
BEGIN

-- Create table: variant-finance-data-project.icarus_sticky.Plan_List
-- Distinct Product_Name_Final_Merged for STICKY orders only
-- Products with both JP and Non-JP will have 2 separate rows

CREATE OR REPLACE TABLE `variant-finance-data-project.icarus_sticky.Plan_List` AS

WITH config AS (
  SELECT 
    DATE('2025-01-01') AS start_date,   -- Change this date as needed
    'Sticky'        AS platform      -- Only this platform is included
),

First_Sale_Dates AS (
  SELECT 
      src.Product_Name_Final_Merged,
      MIN(src.Date_of_Sale) AS Earliest_Sale_Date
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` src
  CROSS JOIN config
  WHERE src.Platform = config.platform
    AND src.Product_Name_Final_Merged IS NOT NULL
    AND src.Product_Name_Final_Merged != ''
  GROUP BY src.Product_Name_Final_Merged
)

SELECT 
    main.Product_Name_Final_Merged AS Product_Name_Final,
    main.Entity_Name,
    main.App_Name,
    main.Trial_Type,
    main.Trial_Period,
    main.Currency,
    MIN(main.Trial_Price) AS Trial_Price,
    COALESCE(
        MIN(CASE WHEN dim.Currency = main.Currency THEN dim.Product_Price END),
        MIN(CASE WHEN TRIM(COALESCE(dim.Currency, '')) = '' THEN dim.Product_Price END)
    ) AS Regular_Price,

    CASE 
        WHEN main.App_Name = 'CT' THEN 
            CASE 
                WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                ELSE 'Non-JP'
            END
        ELSE ''
    END AS Country_Code,

    GREATEST(
        COALESCE(MIN(fsd.Earliest_Sale_Date), MIN(config.start_date)),
        MIN(config.start_date)
    ) AS First_Date_of_Sale

FROM 
    `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` main
LEFT JOIN 
    `variant-finance-data-project.Sticky_Data.Sticky_Dim_Product` dim
    ON CONCAT(dim.Entity, dim.Product_Name_updated) = CONCAT(
        main.Entity_Name,
        REGEXP_EXTRACT(main.Product_Name_Final_Merged, r'^.{2}(\d+)')
    )
    AND (dim.Currency = main.Currency OR TRIM(COALESCE(dim.Currency, '')) = '')
LEFT JOIN
    First_Sale_Dates fsd
    ON main.Product_Name_Final_Merged = fsd.Product_Name_Final_Merged
CROSS JOIN
    config
WHERE 
    main.Platform = config.platform
    AND main.Date_of_Sale >= config.start_date
    AND main.Product_Name_Final_Merged IS NOT NULL
    AND main.Product_Name_Final_Merged != ''
    AND RIGHT(main.Product_Name_Final_Merged, 2) != 'SS'
    AND main.Billing_Cycle_Updated BETWEEN 0 AND 24
GROUP BY 
    main.Product_Name_Final_Merged,
    main.Entity_Name,
    main.App_Name,
    main.Trial_Type,
    main.Trial_Period,
    main.Currency,
    CASE 
        WHEN main.App_Name = 'CT' THEN 
            CASE 
                WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                ELSE 'Non-JP'
            END
        ELSE ''
    END
ORDER BY 
    main.Product_Name_Final_Merged,
    main.Entity_Name,
    main.App_Name,
    main.Currency,
    Country_Code;

END;

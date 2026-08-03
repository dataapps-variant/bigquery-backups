-- job_id: script_job_cd9cd6e63f42288ef828164b68306f75_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T08:43:57.916000+00:00
-- started: 2026-07-29T08:43:58.438000+00:00
-- ended: 2026-07-29T08:43:59.586000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Plan_List` AS

WITH config AS (
  SELECT DATE('2025-01-01') AS start_date  -- Change this date as needed
),

First_Sale_Dates AS (
  SELECT 
      Product_Name_Final_Merged,
      MIN(Date_of_Sale) AS Earliest_Sale_Date
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Product_Name_Final_Merged IS NOT NULL
    AND Product_Name_Final_Merged != ''
  GROUP BY Product_Name_Final_Merged
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
    
    -- Country_Code: will create separate rows for JP and Non-JP
    CASE 
        WHEN main.App_Name = 'CT' THEN 
            CASE 
                WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
                ELSE 'Non-JP'
            END
        ELSE ''
    END AS Country_Code,

    -- Earliest sale date for the plan, floored at 2025-01-01
    GREATEST(
        COALESCE(MIN(fsd.Earliest_Sale_Date), DATE '2025-01-01'),
        DATE '2025-01-01'
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
    main.Date_of_Sale >= config.start_date  -- Using start_date instead of interval
    AND main.Product_Name_Final_Merged IS NOT NULL
    AND main.Product_Name_Final_Merged != ''
    AND RIGHT(main.Product_Name_Final_Merged, 2) != 'SS'
    AND main.Billing_Cycle_Updated BETWEEN 0 AND 12
GROUP BY 
    main.Product_Name_Final_Merged,
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
    main.Product_Name_Final_Merged,
    main.Entity_Name,
    main.App_Name,
    main.Currency,
    Country_Code

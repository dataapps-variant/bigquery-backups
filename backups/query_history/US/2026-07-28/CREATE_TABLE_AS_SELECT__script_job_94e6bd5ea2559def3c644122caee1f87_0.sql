-- job_id: script_job_94e6bd5ea2559def3c644122caee1f87_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T14:39:34.431000+00:00
-- started: 2026-07-28T14:39:35.023000+00:00
-- ended: 2026-07-28T14:39:36.277000+00:00

CREATE OR REPLACE TABLE `Icarus_Cohort.IC_Plan_List` AS

WITH First_Sale_Dates AS (
  SELECT 
      Product_Name_Final_Merged,
      MIN(Date_of_Sale) AS Earliest_Sale_Date
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Product_Name_Final_Merged IS NOT NULL
    AND Product_Name_Final_Merged != ''
  GROUP BY Product_Name_Final_Merged
)

SELECT 
    main.Product_Name_Final_Merged AS Product_Name_Final,  -- CHANGED
    main.Entity_Name,
    main.App_Name,
    COALESCE(main.AFID_CHANNEL, 80) AS AFID,
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
        REGEXP_EXTRACT(main.Product_Name_Final_Merged, r'^.{2}(\d+)')  -- CHANGED
    )
    AND (dim.Currency = main.Currency OR TRIM(COALESCE(dim.Currency, '')) = '')
LEFT JOIN
    First_Sale_Dates fsd
    ON main.Product_Name_Final_Merged = fsd.Product_Name_Final_Merged
WHERE 
    main.Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
    AND main.Product_Name_Final_Merged IS NOT NULL      -- CHANGED
    AND main.Product_Name_Final_Merged != ''            -- CHANGED
    AND RIGHT(main.Product_Name_Final_Merged, 2) != 'SS'  -- CHANGED
    AND main.Billing_Cycle_Updated BETWEEN 0 AND 12
GROUP BY 
    main.Product_Name_Final_Merged,  -- CHANGED
    main.Entity_Name,
    main.App_Name,
    COALESCE(main.AFID_CHANNEL, 80),
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
    main.Product_Name_Final_Merged,  -- CHANGED
    main.Entity_Name,
    main.App_Name,
    Country_Code

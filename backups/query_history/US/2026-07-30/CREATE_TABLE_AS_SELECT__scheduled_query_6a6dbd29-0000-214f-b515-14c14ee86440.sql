-- job_id: scheduled_query_6a6dbd29-0000-214f-b515-14c14ee86440
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T09:00:07.420000+00:00
-- started: 2026-07-30T09:00:07.740000+00:00
-- ended: 2026-07-30T09:00:11.992000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.VPU_Merged.Plan_List` AS

WITH config AS (
  SELECT DATE('2025-01-01') AS start_date
)

SELECT 
    main.Product_Name_Final_Merged AS Product_Name_Final,
    main.Entity_Name,
    main.App_Name,
    main.Trial_Type,
    main.Trial_Period,
    main.Currency,
    MIN(main.Trial_Price) AS Trial_Price,
    MIN(dim.Product_Price) AS Regular_Price,
    
    -- NEW: Lookup Delay days from Dim table, default to 30 if no match
    MIN(COALESCE(sot.`Delay days`, 30)) AS Reg_BC_Period,
    
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
    ON CONCAT(dim.Entity, dim.Product_Name_updated) = CONCAT(
        main.Entity_Name,
        REGEXP_EXTRACT(main.Product_Name_Final_Merged, r'^.{2}(\d+)')
    )
-- NEW: Join to SOT Days Map using first 6 chars of Product_Name + Trial_Type
LEFT JOIN 
    `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` sot
    ON sot.`Plan Name` = CONCAT(LEFT(main.Product_Name_Final_Merged, 6), main.Trial_Type)
CROSS JOIN
    config
WHERE 
    main.Date_of_Sale >= config.start_date
    AND main.Product_Name_Final_Merged IS NOT NULL
    AND main.Product_Name_Final_Merged != ''
    AND RIGHT(main.Product_Name_Final_Merged, 2) != 'SS'
    AND main.Billing_Cycle_Updated BETWEEN 0 AND 4
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

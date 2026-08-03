-- job_id: scheduled_query_6a89016a-0000-21ab-89ea-d4f547f40c40
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T10:15:04.982000+00:00
-- started: 2026-07-29T10:15:05.514000+00:00
-- ended: 2026-07-29T10:15:07.298000+00:00

CREATE OR REPLACE TABLE `CWC.Plan_List` AS
SELECT 
    main.Product_Name_Final_Merged AS Product_Name_Final,  -- CHANGED
    main.Entity_Name,
    main.App_Name,
    COALESCE(main.AFID_CHANNEL, 80) AS AFID,
    main.Trial_Type,
    main.Trial_Period,
    main.Currency,
    MIN(main.Trial_Price) AS Trial_Price,
    MIN(dim.Product_Price) AS Regular_Price,
    
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
        REGEXP_EXTRACT(main.Product_Name_Final_Merged, r'^.{2}(\d+)')  -- CHANGED
    )
WHERE 
    main.Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
    AND main.Product_Name_Final_Merged IS NOT NULL      -- CHANGED
    AND main.Product_Name_Final_Merged != ''            -- CHANGED
    AND RIGHT(main.Product_Name_Final_Merged, 2) != 'SS'  -- CHANGED
    AND main.Billing_Cycle_Updated BETWEEN 0 AND 4
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
    Country_Code;

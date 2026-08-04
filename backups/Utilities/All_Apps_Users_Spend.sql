CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.All_Apps_Users_Spend` AS
WITH 
-- Get list of miscellaneous countries
miscellaneous_countries AS (
    SELECT Miscellaneous_Countries
    FROM `variant-finance-data-project.Sticky_Data.Miscellaneous_Countries`
),

base_data AS (
    -- Sticky data - All apps from 2025-01-01 onwards
    SELECT 
        Date_of_Sale AS Day_Charged,
        App_Name AS APP_SHORT_NAME,
        CONCAT(
            LPAD(COALESCE(Product_Name_updated, '0'), 4, '0'),
            COALESCE(Trial_Type, '')
        ) AS PLAN_NAME,
        LPAD(CAST(AFID_CHANNEL AS STRING), 2, '0') AS Channel,
        CASE 
            WHEN EXISTS (SELECT 1 FROM miscellaneous_countries mc WHERE mc.Miscellaneous_Countries = Spend_Country_Code_AFID) THEN 'OR'
            ELSE Spend_Country_Code_AFID
        END AS Country,
        CAST(COUNT(Order_ID) AS FLOAT64) AS Metric,
        'New Users' AS Type

    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`

    WHERE Date_of_Sale >= DATE('2025-01-01')

    GROUP BY 
        Date_of_Sale,
        App_Name,
        CONCAT(
            LPAD(COALESCE(Product_Name_updated, '0'), 4, '0'),
            COALESCE(Trial_Type, '')
        ),
        AFID_CHANNEL,
        Spend_Country_Code_AFID

    UNION ALL

    -- Spend data - All apps from 2025-01-01 onwards (NO miscellaneous countries logic)
    SELECT 
        Date AS Day_Charged,
        App_name AS APP_SHORT_NAME,
        CAST(NULL AS STRING) AS PLAN_NAME,
        LPAD(CAST(Channel_code AS STRING), 2, '0') AS Channel,
        Country AS Country,
        SUM(allocated_spend) AS Metric,
        'Spend' AS Type

    FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`

    WHERE Date >= DATE('2025-01-01')

    GROUP BY 
        Date,
        App_name,
        Channel_code,
        Country
)

-- Final SELECT with lookup and split logic
SELECT 
    base.Day_Charged,
    
    -- Split Updated_Concat: First 2 characters as APP_SHORT_NAME
    COALESCE(
        SUBSTRING(upd.Updated_Concat, 1, 2),
        base.APP_SHORT_NAME
    ) AS APP_SHORT_NAME,
    
    -- Split Updated_Concat: Rest after first 2 characters as PLAN_NAME
    COALESCE(
        SUBSTRING(upd.Updated_Concat, 3),
        base.PLAN_NAME
    ) AS PLAN_NAME,
    
    base.Channel,
    base.Country,
    
    -- Cohort: Combination of Channel + Country
    CONCAT(base.Channel, base.Country) AS Cohort,
    
    base.Type,
    base.Metric

FROM base_data base
LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` upd
    ON CONCAT(base.APP_SHORT_NAME, base.PLAN_NAME) = upd.Concat

ORDER BY Day_Charged DESC;

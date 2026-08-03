-- job_id: scheduled_query_6a899352-0000-2535-a1a3-089e0831bf14
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T08:00:06.541000+00:00
-- started: 2026-07-31T08:00:06.993000+00:00
-- ended: 2026-07-31T08:00:08.787000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.R100.IQ_new_trailing100` AS
WITH 
-- Get list of miscellaneous countries
miscellaneous_countries AS (
    SELECT Miscellaneous_Countries
    FROM `variant-finance-data-project.Sticky_Data.Miscellaneous_Countries`
),

-- Step 1B: Find products from other apps that map to IQ
cross_app_products AS (
    SELECT DISTINCT
        App_Name,
        Product_Name
    FROM `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name`
    WHERE Updated_App_Name = 'IQ'
        AND App_Name != 'IQ'
),

base_data AS (
    -- Step 1A: First data source - Direct IQ data from Sticky table
    SELECT 
        -- Day Charged (past 100 days) - Date_of_Sale filtered for last 100 days
        Date_of_Sale AS Day_Charged,
        
        -- APP SHORT NAME - App_Name from base table
        App_Name AS APP_SHORT_NAME,
        
        -- PLAN NAME - Concatenation of 4-digit padded Product_Name_updated and Trial_Type
        CONCAT(
            LPAD(COALESCE(Product_Name_updated, '0'), 4, '0'),
            COALESCE(Trial_Type, '')
        ) AS PLAN_NAME,
        
        -- Day First Charge/Acquired - Acquisition_Date_Time as actual DATE data type
        DATE(Acquisition_Date_Time) AS Day_First_Charge_Acquired,
        
        -- COHORT (Network/Country IDs) - Concatenation of AFID_CHANNEL (2 digits) + Country (replaced with OR if miscellaneous)
        CONCAT(
            LPAD(CAST(AFID_CHANNEL AS STRING), 2, '0'), 
            CASE 
                WHEN EXISTS (SELECT 1 FROM miscellaneous_countries mc WHERE mc.Miscellaneous_Countries = Spend_Country_Code_AFID) THEN 'OR'
                ELSE COALESCE(Spend_Country_Code_AFID, '')
            END
        ) AS COHORT_Network_Country_IDs,
        
        -- SPENT AMOUNT - Keep blank
        CAST(NULL AS FLOAT64) AS SPENT_AMOUNT,
        
        -- INITIAL GATEWAY ID - Keep blank  
        CAST(NULL AS STRING) AS INITIAL_GATEWAY_ID,
        
        -- CURRENT GATEWAY ID - Gateway_Id from sticky table
        Gateway_Id AS CURRENT_GATEWAY_ID,
        
        -- BILLING CYCLE - Billing_Cycle_Updated from base table
        Billing_Cycle_Updated AS BILLING_CYCLE,
        
        -- ORDER COUNT - Count of Order_Id grouped by all previous columns
        COUNT(DISTINCT Updated_Cust_ID) AS ORDER_COUNT

    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`

    -- Filter for last 100 days from current date and App_Name = "IQ"
    WHERE Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
        AND Date_of_Sale <= CURRENT_DATE()
        AND App_Name = "IQ"

    -- Group by all columns except the count
    GROUP BY 
        Date_of_Sale,
        App_Name,
        CONCAT(
            LPAD(COALESCE(Product_Name_updated, '0'), 4, '0'),
            COALESCE(Trial_Type, '')
        ),
        DATE(Acquisition_Date_Time),
        AFID_CHANNEL,
        Spend_Country_Code_AFID,
        Gateway_Id,
        Billing_Cycle_Updated

    UNION ALL

    -- Step 1B: Additional data from other apps that map to IQ
    SELECT 
        -- Day Charged (past 100 days) - Date_of_Sale filtered for last 100 days
        sticky.Date_of_Sale AS Day_Charged,
        
        -- APP SHORT NAME - App_Name from base table
        sticky.App_Name AS APP_SHORT_NAME,
        
        -- PLAN NAME - Concatenation of 4-digit padded Product_Name_updated and Trial_Type
        CONCAT(
            LPAD(COALESCE(sticky.Product_Name_updated, '0'), 4, '0'),
            COALESCE(sticky.Trial_Type, '')
        ) AS PLAN_NAME,
        
        -- Day First Charge/Acquired - Acquisition_Date_Time as actual DATE data type
        DATE(sticky.Acquisition_Date_Time) AS Day_First_Charge_Acquired,
        
        -- COHORT (Network/Country IDs) - Concatenation of AFID_CHANNEL (2 digits) + Country (replaced with OR if miscellaneous)
        CONCAT(
            LPAD(CAST(sticky.AFID_CHANNEL AS STRING), 2, '0'), 
            CASE 
                WHEN EXISTS (SELECT 1 FROM miscellaneous_countries mc WHERE mc.Miscellaneous_Countries = sticky.Spend_Country_Code_AFID) THEN 'OR'
                ELSE COALESCE(sticky.Spend_Country_Code_AFID, '')
            END
        ) AS COHORT_Network_Country_IDs,
        
        -- SPENT AMOUNT - Keep blank
        CAST(NULL AS FLOAT64) AS SPENT_AMOUNT,
        
        -- INITIAL GATEWAY ID - Keep blank  
        CAST(NULL AS STRING) AS INITIAL_GATEWAY_ID,
        
        -- CURRENT GATEWAY ID - Gateway_Id from sticky table
        sticky.Gateway_Id AS CURRENT_GATEWAY_ID,
        
        -- BILLING CYCLE - Billing_Cycle_Updated from base table
        sticky.Billing_Cycle_Updated AS BILLING_CYCLE,
        
        -- ORDER COUNT - Count of Order_Id grouped by all previous columns
        COUNT(DISTINCT sticky.Updated_Cust_ID) AS ORDER_COUNT

    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` sticky
    INNER JOIN cross_app_products cap
        ON sticky.App_Name = cap.App_Name
        AND CONCAT(
            LPAD(COALESCE(sticky.Product_Name_updated, '0'), 4, '0'),
            COALESCE(sticky.Trial_Type, '')
        ) = cap.Product_Name

    -- Filter for last 100 days from current date
    WHERE sticky.Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
        AND sticky.Date_of_Sale <= CURRENT_DATE()

    -- Group by all columns except the count
    GROUP BY 
        sticky.Date_of_Sale,
        sticky.App_Name,
        CONCAT(
            LPAD(COALESCE(sticky.Product_Name_updated, '0'), 4, '0'),
            COALESCE(sticky.Trial_Type, '')
        ),
        DATE(sticky.Acquisition_Date_Time),
        sticky.AFID_CHANNEL,
        sticky.Spend_Country_Code_AFID,
        sticky.Gateway_Id,
        sticky.Billing_Cycle_Updated

    UNION ALL

    -- Step 2: Second data source - Ad spend data
    SELECT 
        -- Day Charged (past 100 days) - Date filtered for last 100 days
        Date AS Day_Charged,
        
        -- APP SHORT NAME - App_name from source table
        App_name AS APP_SHORT_NAME,
        
        -- PLAN NAME - Keep blank
        CAST(NULL AS STRING) AS PLAN_NAME,
        
        -- Day First Charge/Acquired - Same as Day Charged (actual DATE data type)
        Date AS Day_First_Charge_Acquired,
        
        -- COHORT (Network/Country IDs) - Concatenation of Channel_code (2 digits) + Country (replaced with OR if miscellaneous)
        CONCAT(
            LPAD(CAST(Channel_code AS STRING), 2, '0'),
            CASE 
                WHEN EXISTS (SELECT 1 FROM miscellaneous_countries mc WHERE mc.Miscellaneous_Countries = Country) THEN 'OR'
                ELSE COALESCE(Country, '')
            END
        ) AS COHORT_Network_Country_IDs,
        
        -- SPENT AMOUNT - Sum of Amount from source table
        SUM(allocated_spend) AS SPENT_AMOUNT,
        
        -- INITIAL GATEWAY ID - Keep blank  
        CAST(NULL AS STRING) AS INITIAL_GATEWAY_ID,
        
        -- CURRENT GATEWAY ID - Keep blank (Ad spend has no Gateway_Id)
        CAST(NULL AS STRING) AS CURRENT_GATEWAY_ID,
        
        -- BILLING CYCLE - Keep blank
        CAST(NULL AS INTEGER) AS BILLING_CYCLE,
        
        -- ORDER COUNT - Keep blank
        CAST(NULL AS INTEGER) AS ORDER_COUNT

    FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`

    -- Filter for last 100 days from current date and App_name = "IQ"
    WHERE Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
        AND Date <= CURRENT_DATE()
        AND App_name = "IQ"

    -- Group by all columns except SPENT_AMOUNT (which is summed)
    GROUP BY 
        Date,
        App_name,
        Channel_code,
        Country
)

-- Step 3 & 4: Final SELECT with lookup and filter
SELECT 
    base.Day_Charged,
    
    -- APP SHORT NAME - Updated from lookup table
    COALESCE(upd.Updated_App_Name, base.APP_SHORT_NAME) AS APP_SHORT_NAME,
    
    -- PLAN NAME - Updated from lookup table
    COALESCE(upd.Updated_Product_Name, base.PLAN_NAME) AS PLAN_NAME,
    
    base.Day_First_Charge_Acquired,
    base.COHORT_Network_Country_IDs,
    base.SPENT_AMOUNT,
    base.INITIAL_GATEWAY_ID,
    base.CURRENT_GATEWAY_ID,
    base.BILLING_CYCLE,
    base.ORDER_COUNT

FROM base_data base
LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` upd
    ON base.PLAN_NAME = upd.Product_Name
    AND base.APP_SHORT_NAME = upd.App_Name

-- Filter to keep only records where APP_SHORT_NAME = "IQ" after lookup
WHERE COALESCE(upd.Updated_App_Name, base.APP_SHORT_NAME) = 'IQ'
AND base.Day_Charged < CURRENT_DATE()  -- Add this line


-- Final order by Day_Charged for the entire result set
ORDER BY Day_Charged DESC;

CREATE OR REPLACE TABLE `variant-finance-data-project.LMC.CL_refund_data` AS
WITH 
-- Get list of miscellaneous countries
miscellaneous_countries AS (
    SELECT Miscellaneous_Countries
    FROM `variant-finance-data-project.Sticky_Data.Miscellaneous_Countries`
),

-- Step 2: Find products from other apps that map to CL
cross_app_products AS (
    SELECT DISTINCT
        App_Name,
        Concat
    FROM `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name`
    WHERE Updated_App_Name != App_Name
        AND Updated_App_Name = 'CL'
),

base_data AS (
    -- Step 1: Direct CL refund data
    SELECT 
        DATE_TRUNC(DATE(Acquisition_Date_Time), MONTH) as Plan_Start_Month,
        Billing_Cycle_Updated as billing_cycle,
        DATE_TRUNC(Refund_Date, MONTH) as Refund_Date_Month,
        SUM(Refund_Amount_USD) as Refund_Amount,
        CONCAT(
            Product_Name_Final, 
            LPAD(CAST(AFID_CHANNEL as STRING), 2, '0'), 
            CASE 
                WHEN EXISTS (SELECT 1 FROM miscellaneous_countries mc WHERE mc.Miscellaneous_Countries = Spend_Country_Code_AFID) THEN 'OR'
                ELSE Spend_Country_Code_AFID
            END
        ) as Plan_Concat,
        Product_Name_Final as Cohort_Concat
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE App_Name = 'CL'
        AND Acquisition_Date_Time IS NOT NULL
        AND DATE(Acquisition_Date_Time) IS NOT NULL
    GROUP BY 
        DATE_TRUNC(DATE(Acquisition_Date_Time), MONTH),
        Product_Name_Final,
        AFID_CHANNEL,
        Spend_Country_Code_AFID,
        Billing_Cycle_Updated,
        DATE_TRUNC(Refund_Date, MONTH)

    UNION ALL

    -- Step 2: Additional cross-app refund data
    SELECT 
        DATE_TRUNC(DATE(sticky.Acquisition_Date_Time), MONTH) as Plan_Start_Month,
        sticky.Billing_Cycle_Updated as billing_cycle,
        DATE_TRUNC(sticky.Refund_Date, MONTH) as Refund_Date_Month,
        SUM(sticky.Refund_Amount_USD) as Refund_Amount,
        CONCAT(
            sticky.Product_Name_Final, 
            LPAD(CAST(sticky.AFID_CHANNEL as STRING), 2, '0'), 
            CASE 
                WHEN EXISTS (SELECT 1 FROM miscellaneous_countries mc WHERE mc.Miscellaneous_Countries = sticky.Spend_Country_Code_AFID) THEN 'OR'
                ELSE sticky.Spend_Country_Code_AFID
            END
        ) as Plan_Concat,
        sticky.Product_Name_Final as Cohort_Concat
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` sticky
    INNER JOIN cross_app_products cap
        ON sticky.App_Name = cap.App_Name
        AND sticky.Product_Name_Final = cap.Concat
    WHERE sticky.Acquisition_Date_Time IS NOT NULL
        AND DATE(sticky.Acquisition_Date_Time) IS NOT NULL
    GROUP BY 
        DATE_TRUNC(DATE(sticky.Acquisition_Date_Time), MONTH),
        sticky.Product_Name_Final,
        sticky.AFID_CHANNEL,
        sticky.Spend_Country_Code_AFID,
        sticky.Billing_Cycle_Updated,
        DATE_TRUNC(sticky.Refund_Date, MONTH)
)

-- Step 3 & 4: Final SELECT with lookup and additional columns
SELECT 
    base.Plan_Start_Month,
    base.billing_cycle,
    base.Refund_Amount,
    
    -- Step 4: Plan_Concat - Replace Product_Name_Final with Updated_Concat
    CONCAT(
        COALESCE(upd.Updated_Concat, base.Cohort_Concat),
        SUBSTRING(base.Plan_Concat, LENGTH(base.Cohort_Concat) + 1)
    ) as Plan_Concat,
    
    -- Step 3: Cohort_Concat - Replace with Updated_Concat
    COALESCE(upd.Updated_Concat, base.Cohort_Concat) as Cohort_Concat,
    
    -- New columns
    CONCAT(
        COALESCE(upd.Updated_Concat, base.Cohort_Concat),
        SUBSTRING(base.Plan_Concat, LENGTH(base.Cohort_Concat) + 1)
    ) as Cohort,
    
    base.Refund_Date_Month as Current_Month

FROM base_data base
LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` upd
    ON base.Cohort_Concat = upd.Concat

-- Step 5: Filter to keep only records where first 2 letters of Cohort_Concat = "CL"
WHERE SUBSTRING(COALESCE(upd.Updated_Concat, base.Cohort_Concat), 1, 2) = 'CL'

ORDER BY 
    Plan_Start_Month DESC, 
    Plan_Concat, 
    billing_cycle;

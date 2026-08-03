-- job_id: scheduled_query_6a6b958b-0000-2bae-a049-7474463f9b85
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T09:00:06.803000+00:00
-- started: 2026-07-28T09:00:07.099000+00:00
-- ended: 2026-07-28T09:00:08.222000+00:00

-- =====================================================
-- USER COUNT BY DAY TABLE - MODIFIED VERSION
-- 
-- MODIFICATIONS APPLIED:
-- 1. Output table: Sticky_Data → VPU_Merged dataset
-- 2. Column name: Product_Name_Final → Product_Name_Final_Merged
-- Total: 2 changes
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.VPU_Merged.User_Count_by_Day` AS
SELECT 
    Date_of_Sale,
    -- New App_Name: Concatenate Original App_Name with Country_Code
    CASE 
        WHEN CASE 
                WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
                WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'Non-JP'
                ELSE NULL 
             END IS NOT NULL 
        THEN CONCAT(App_Name, '-', 
                    CASE 
                        WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
                        WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'Non-JP'
                        ELSE NULL 
                    END)
        ELSE App_Name
    END AS App_Name,
    AFID_CHANNEL,
    Spend_Country_Code_AFID,
    Product_Name_Final_Merged AS Product_Name_Final,
    Billing_Cycle_Updated AS BC,
    COUNT(Order_Id) AS Daily_Users
FROM 
    `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE 
    Billing_Cycle = '0'
    AND Date_of_Sale IS NOT NULL
    AND Product_Name_Final_Merged IS NOT NULL
    AND Date_of_Sale > DATE('2023-12-31')
GROUP BY 
    Date_of_Sale,
    App_Name,
    AFID_CHANNEL,
    Spend_Country_Code_AFID,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated
ORDER BY 
    Date_of_Sale DESC,
    App_Name,
    AFID_CHANNEL,
    Spend_Country_Code_AFID,
    Product_Name_Final,
    Billing_Cycle_Updated;

-- =====================================================
-- SCRIPT COMPLETE - MODIFIED VERSION
-- Table: variant-finance-data-project.VPU_Merged.User_Count_by_Day
-- 
-- MODIFICATIONS SUMMARY:
-- =====================================================
-- 
-- CHANGE 1: DATASET MIGRATION
-- Output table: Sticky_Data.User_Count_by_Day → VPU_Merged.User_Count_by_Day
-- Line: 9
--
-- CHANGE 2: COLUMN NAME UPDATE (4 locations)
-- Product_Name_Final → Product_Name_Final_Merged
-- Locations:
-- - Line 27: SELECT clause (aliased back to Product_Name_Final)
-- - Line 34: WHERE clause
-- - Line 41: GROUP BY clause
-- - Line 47: ORDER BY clause (kept as Product_Name_Final - alias)
--
-- TOTAL CHANGES: 5 (1 dataset + 4 column references)
-- 
-- OUTPUT SCHEMA:
-- - Date_of_Sale (DATE)
-- - App_Name (STRING) - Computed with CT-JP/CT-Non-JP logic
-- - AFID_CHANNEL (INTEGER)
-- - Spend_Country_Code_AFID (STRING)
-- - Product_Name_Final (STRING) - Alias for Product_Name_Final_Merged
-- - BC (INTEGER) - Alias for Billing_Cycle_Updated
-- - Daily_Users (INTEGER) - COUNT(Order_Id)
-- 
-- KEY FEATURES PRESERVED:
-- - CT-JP/CT-Non-JP App_Name concatenation logic
-- - Billing_Cycle = '0' filter
-- - Date_of_Sale > 2023-12-31 filter
-- - Daily user count aggregation
-- =====================================================

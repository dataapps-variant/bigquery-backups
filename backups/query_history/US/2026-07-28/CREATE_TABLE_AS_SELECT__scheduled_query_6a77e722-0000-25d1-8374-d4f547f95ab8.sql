-- job_id: scheduled_query_6a77e722-0000-25d1-8374-d4f547f95ab8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T19:49:04.683000+00:00
-- started: 2026-07-28T19:49:04.966000+00:00
-- ended: 2026-07-28T19:49:06.427000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.User_Count_by_Day` AS
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
    Product_Name_Final,
    Billing_Cycle_Updated AS BC,
    COUNT(Order_Id) AS Daily_Users
FROM 
    `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE 
    Billing_Cycle = '0'
    AND Date_of_Sale IS NOT NULL
    AND Product_Name_Final IS NOT NULL
    AND Date_of_Sale > DATE('2023-12-31')
GROUP BY 
    Date_of_Sale,
    App_Name,
    AFID_CHANNEL,
    Spend_Country_Code_AFID,
    Product_Name_Final,
    Billing_Cycle_Updated
ORDER BY 
    Date_of_Sale DESC,
    App_Name,
    AFID_CHANNEL,
    Spend_Country_Code_AFID,
    Product_Name_Final,
    Billing_Cycle_Updated;

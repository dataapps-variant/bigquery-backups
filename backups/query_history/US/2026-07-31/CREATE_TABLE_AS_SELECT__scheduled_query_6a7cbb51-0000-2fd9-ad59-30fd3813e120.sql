-- job_id: scheduled_query_6a7cbb51-0000-2fd9-ad59-30fd3813e120
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T12:00:05.661000+00:00
-- started: 2026-07-31T12:00:06.049000+00:00
-- ended: 2026-07-31T12:00:08.981000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.New_User_Count_by_Day` AS
SELECT 
    Date_of_Sale,
    App_Name,
    AFID_CHANNEL,
    Spend_Country_Code_AFID,
    Product_Name_Final AS Plan_Name,
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
    Product_Name_Final
ORDER BY 
    Date_of_Sale DESC,
    App_Name,
    AFID_CHANNEL,
    Spend_Country_Code_AFID,
    Product_Name_Final;

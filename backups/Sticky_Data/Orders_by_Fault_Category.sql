-- Configurable date range
DECLARE start_date DATE DEFAULT DATE('2025-01-01');
DECLARE end_date DATE DEFAULT CURRENT_DATE();

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Orders_by_Fault_Category` AS

SELECT
    App_Name,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    Decline_Reason_Category,
    Fault_Category,
    COUNT(DISTINCT Updated_Cust_ID) AS Count_of_Customers

FROM
    `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`

WHERE
    Final_Order_Status = 7
    AND Billing_Cycle_Updated IN (0, 1, 2, 3, 4)
    AND Date_of_Sale BETWEEN start_date AND end_date

GROUP BY
    App_Name,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    Decline_Reason_Category,
    Fault_Category

ORDER BY
    App_Name,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    Decline_Reason_Category,
    Fault_Category;



WITH InitialCohort AS (
          -- Step 1: Find the unique customers in the initial billing cycle
          SELECT DISTINCT Updated_Cust_ID
          FROM `variant-finance-data-project.Sticky_Data.Sticky_Sales_V` 
          WHERE
            FINAL_ORDER_STATUS IN (2, 6)
            AND Billing_Cycle_Updated = 4
            AND Spend_Country_Code IN ("CA","US")
            AND AFID_CHANNEL IN (2,22,20,11)
            AND Product_Name_Final IN ("PD2595ST")
            AND Date_of_Sale BETWEEN DATE("2025-03-14") AND DATE("2025-03-23")
        )
        -- Step 2: Count how many of those customers appear in the next billing cycle
        SELECT
          COUNT(DISTINCT T.Updated_Cust_ID) AS renewed_user_count
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Sales_V`  AS T
        WHERE
          T.Updated_Cust_ID IN (SELECT Updated_Cust_ID FROM InitialCohort)
          AND T.Billing_Cycle_Updated = 5
          AND T.FINAL_ORDER_STATUS IN (2, 6)
          AND T.Spend_Country_Code IN ("CA","US")
          AND T.AFID_CHANNEL IN (2,22,20,11)
          AND T.Product_Name_Final IN ("PD2595ST")

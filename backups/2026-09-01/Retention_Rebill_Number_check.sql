WITH FirstCycleCustomers AS (
  -- This is your original query to get the top 1000 customers in their first cycle
  SELECT
    Updated_Cust_ID
  FROM
    `Sticky_Data.Sticky_Sales_V`
  WHERE
    Date_of_Sale <= DATE('2025-03-23')
    AND Product_Name_Final = 'PD2595ST'
    AND FINAL_ORDER_STATUS IN (2, 6)
    AND Spend_Country_Code IN ('CA', 'US')
    AND AFID_CHANNEL IN (2, 22, 1, 20)
    AND Billing_Cycle_Updated = 2
    AND Date_of_Sale >= DATE('2025-03-03')

)
-- Now, count how many of those specific customers also have a second billing cycle record
SELECT
  COUNT(DISTINCT T2.Updated_Cust_ID) AS Subscribed_to_Next_Cycle
FROM
  `Sticky_Data.Sticky_Sales_V` AS T2
  INNER JOIN FirstCycleCustomers AS T1 ON T2.Updated_Cust_ID = T1.Updated_Cust_ID
WHERE
  T2.Billing_Cycle_Updated = 3
  AND FINAL_ORDER_STATUS IN (2, 6);

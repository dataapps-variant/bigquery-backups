SELECT count(Updated_Order_ID)
FROM `variant-finance-data-project.Sticky_Data.Sticky_Sales_V`
WHERE 
  FINAL_ORDER_STATUS IN (2,6)
  AND Billing_Cycle_Updated = 0
  AND Spend_Country_Code IN ('CA', 'US')
  AND AFID_CHANNEL IN (2, 20, 1, 22)
  AND Product_Name_Final = 'PD2595ST'
  AND Date_of_Sale between DATE('2025-05-17') and date('2025-05-22')
limit 1000

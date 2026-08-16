SELECT SUM(Order_Price_Net_of_Tax_USD) AS total_price
FROM `variant-finance-data-project.Sticky_Data.Sticky_Sales_V`
WHERE 
  FINAL_ORDER_STATUS IN (2,6)
  AND Billing_Cycle_Updated = 0
  AND Spend_Country_Code IN ('CA', 'US')
  AND AFID_CHANNEL IN (2, 20, 1, 22)
  AND Product_Name_Final = 'PD2595ST'
  AND Date_of_Sale between DATE('2025-02-24') and date('2025-03-23')
limit 1000

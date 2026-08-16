SELECT Date_of_Sale, Order_Id
FROM `variant-finance-data-project.Sticky_Data.Sticky_Sales_V`
WHERE Product_Name_Final = 'PD4988ST'
  AND FINAL_ORDER_STATUS IN (2,6)
  AND Spend_Country_Code IN ('CA', 'US')
  AND AFID_CHANNEL IN (2, 20, 1, 22)
  AND Date_of_Sale <= DATE('2025-03-23')
  AND Billing_Cycle_Updated = 2
  order by Date_of_Sale asc
limit 1000

SELECT DISTINCT Updated_Cust_ID 
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
WHERE Date_of_Sale <= "2026-02-23"
AND Date_of_Sale >= "2026-01-26"
AND Billing_Cycle_Updated = 0
    AND Product_Name_Final = "JF2788ST"
    AND Final_Order_Status IN (2, 6, 8)
    And Payment = "visa"
    AND Is_Chargeback = "0"
    AND Is_Refund = "no"
  LIMIT 7000

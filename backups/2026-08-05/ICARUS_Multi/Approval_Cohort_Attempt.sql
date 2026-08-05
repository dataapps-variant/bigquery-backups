WITH base_data AS (
  SELECT DISTINCT Updated_Cust_Id
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE Date_of_Sale <= "2025-11-15"
  And Date_of_sale >= "2025-10-16"
    AND Billing_Cycle_Updated = 3
    AND Product_Name_Final = "JF2788ST"
    AND Final_Order_Status IN (2, 6, 8)
    AND Is_Chargeback = "0"
    AND Is_Refund = "no"
  LIMIT 7000
)

SELECT COUNT(DISTINCT a.Updated_Cust_Id) AS customers_with_cycle_2
FROM base_data a
JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` b
  ON a.Updated_Cust_Id = b.Updated_Cust_Id
WHERE b.Billing_Cycle_Updated = 4

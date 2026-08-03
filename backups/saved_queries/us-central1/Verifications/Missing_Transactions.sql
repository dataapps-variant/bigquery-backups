SELECT ct.*
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_W_EC` ct
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` m
  ON ct.Updated_Cust_ID = m.Updated_Cust_ID
  AND m.Entity_Name = 'CT'
  AND m.Final_Order_Status IN (2, 6, 8)
WHERE ct.Final_Order_Status IN (2, 6, 8)
  AND m.Updated_Cust_ID IS NULL

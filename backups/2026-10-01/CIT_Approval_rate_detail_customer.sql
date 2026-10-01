SELECT 
  Date_of_Sale AS order_date,
  Order_Id,
  Customer_Number,
  Billing_Cycle,
  Billing_Cycle_Updated,
  Product_Name_Final_Merged AS plan,
  Final_Order_Status,
  CASE 
    WHEN Final_Order_Status <> 7 THEN 'SUCCESS'
    ELSE 'FAILED'
  END AS order_outcome,
  Retry_Attempt,
  Decline_Reason,
  Decline_Reason_Category,
  Fault_Category,
  Gateway_Id,
  AFID,
  Parent_Order_Id
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
WHERE App_Name = 'JF'
  AND Billing_Cycle = '0'
  AND AFID = 'gdnussaimax'
  AND Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
  AND Date_of_Sale <> CURRENT_DATE()
ORDER BY order_date DESC, order_outcome DESC, Customer_Number

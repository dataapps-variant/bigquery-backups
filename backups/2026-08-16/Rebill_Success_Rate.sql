SELECT 
  o.Order_Id AS parent_order_id,
  o.Customer_Number AS customer_id,
  o.Date_of_Sale AS original_order_date,
  o.Billing_Cycle AS current_billing_cycle,
  DATE(o.Recurring_Date) AS scheduled_rebill_date,
  o.Product_Name_Final_Merged AS plan,
  o.Final_Order_Status AS parent_order_status,
  n.Order_Id AS rebill_order_id,
  n.Date_of_Sale AS actual_rebill_date,
  n.Billing_Cycle AS rebill_billing_cycle,
  n.Final_Order_Status AS rebill_order_status,
  CASE 
    WHEN n.Order_Id IS NOT NULL THEN 'SUCCESS' 
    ELSE 'FAILED' 
  END AS rebill_outcome
FROM (
  SELECT 
    Order_Id,
    Customer_Number,
    Date_of_Sale,
    Billing_Cycle,
    Recurring_Date,
    Product_Name_Final_Merged,
    Final_Order_Status,
    App_Name
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'JF'
    AND Product_Name_Final_Merged = 'JF2788ST'
    AND Billing_Cycle = '3'
    AND Final_Order_Status <> 7
    AND Recurring_Date <> '0000-00-00'
    AND DATE(Recurring_Date) = DATE '2026-05-19'
) AS o
LEFT JOIN (
  SELECT 
    Order_Id,
    Parent_Order_Id,
    Customer_Number,
    Date_of_Sale,
    Billing_Cycle,
    Final_Order_Status,
    App_Name,
    Product_Name_Final_Merged
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'JF'
    AND Product_Name_Final_Merged = 'JF2788ST'
    AND Final_Order_Status <> 7
    AND Date_of_Sale = DATE '2026-05-19'
) AS n 
  ON o.Order_Id = n.Parent_Order_Id 
  AND DATE(o.Recurring_Date) = n.Date_of_Sale 
  AND o.App_Name = n.App_Name 
  AND o.Product_Name_Final_Merged = n.Product_Name_Final_Merged
ORDER BY rebill_outcome DESC, o.Customer_Number

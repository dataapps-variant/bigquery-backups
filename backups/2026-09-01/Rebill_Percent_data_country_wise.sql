WITH parent_orders AS (
  SELECT 
    Order_Id,
    Customer_Number,
    Date_of_Sale,
    Billing_Cycle,
    Billing_Cycle_Updated,
    Recurring_Date,
    Product_Name_Final_Merged,
    Final_Order_Status,
    App_Name,
    Spend_Country_Code_AFID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Product_Name_Final_Merged = 'CT2788YT'
    AND Billing_Cycle = '0'
    AND Final_Order_Status <> 7
    AND Recurring_Date <> '0000-00-00'
    AND DATE(Recurring_Date) = DATE '2026-05-28'
    AND Spend_Country_Code_AFID = 'US'
),

child_exact_match AS (
  SELECT 
    Order_Id,
    Parent_Order_Id,
    Customer_Number,
    Date_of_Sale,
    Billing_Cycle,
    Billing_Cycle_Updated,
    Final_Order_Status,
    App_Name,
    Product_Name_Final_Merged,
    Spend_Country_Code_AFID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Product_Name_Final_Merged = 'CT2788YT'
    AND Final_Order_Status <> 7
    AND Date_of_Sale = DATE '2026-05-28'
    AND Spend_Country_Code_AFID = 'US'
),

ec_outcome AS (
  SELECT 
    Customer_Number,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    Spend_Country_Code_AFID,
    Final_Order_Status,
    ROW_NUMBER() OVER (
      PARTITION BY Customer_Number, Product_Name_Final_Merged, Billing_Cycle_Updated, Spend_Country_Code_AFID
      ORDER BY 
        CASE WHEN Final_Order_Status IN (2, 6) THEN 1 ELSE 2 END,
        Date_of_Sale DESC
    ) AS rn
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Product_Name_Final_Merged = 'CT2788YT'
    AND Billing_Cycle_Updated = 1
    AND Spend_Country_Code_AFID = 'US'
),

ec_outcome_final AS (
  SELECT 
    Customer_Number,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    Spend_Country_Code_AFID,
    Final_Order_Status AS outcome_status
  FROM ec_outcome
  WHERE rn = 1
),

ec_initial_decline AS (
  SELECT 
    Customer_Number,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    Spend_Country_Code_AFID,
    Decline_Reason,
    Decline_Reason_Category,
    ROW_NUMBER() OVER (
      PARTITION BY Customer_Number, Product_Name_Final_Merged, Billing_Cycle_Updated, Spend_Country_Code_AFID
      ORDER BY Date_of_Sale DESC
    ) AS rn
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Product_Name_Final_Merged = 'CT2788YT'
    AND Billing_Cycle_Updated = 1
    AND Retry_Attempt = '0'
    AND Spend_Country_Code_AFID = 'US'
),

ec_initial_decline_final AS (
  SELECT 
    Customer_Number,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    Spend_Country_Code_AFID,
    Decline_Reason,
    Decline_Reason_Category
  FROM ec_initial_decline
  WHERE rn = 1
)

SELECT 
  o.Order_Id AS parent_order_id,
  o.Customer_Number AS customer_id,
  o.Date_of_Sale AS original_order_date,
  o.Billing_Cycle AS current_billing_cycle,
  o.Billing_Cycle_Updated AS current_billing_cycle_updated,
  DATE(o.Recurring_Date) AS scheduled_rebill_date,
  o.Product_Name_Final_Merged AS plan,
  o.Spend_Country_Code_AFID AS country_code,
  o.Final_Order_Status AS parent_order_status,
  n.Order_Id AS rebill_order_id,
  n.Date_of_Sale AS actual_rebill_date,
  n.Billing_Cycle AS rebill_billing_cycle,
  n.Billing_Cycle_Updated AS rebill_billing_cycle_updated,
  n.Final_Order_Status AS rebill_order_status,
  CASE 
    WHEN n.Order_Id IS NOT NULL THEN 'SUCCESS' 
    ELSE 'FAILED' 
  END AS rebill_outcome,
  CASE 
    WHEN n.Order_Id IS NOT NULL THEN NULL
    WHEN ec_o.outcome_status IS NULL THEN 'Not Found'
    ELSE CAST(ec_o.outcome_status AS STRING)
  END AS ec_final_order_status,
  CASE 
    WHEN n.Order_Id IS NOT NULL THEN NULL
    ELSE ec_d.Decline_Reason
  END AS ec_decline_reason,
  CASE 
    WHEN n.Order_Id IS NOT NULL THEN NULL
    ELSE ec_d.Decline_Reason_Category
  END AS ec_decline_reason_category
FROM parent_orders AS o
LEFT JOIN child_exact_match AS n 
  ON o.Order_Id = n.Parent_Order_Id 
  AND DATE(o.Recurring_Date) = n.Date_of_Sale 
  AND o.App_Name = n.App_Name 
  AND o.Product_Name_Final_Merged = n.Product_Name_Final_Merged
  AND o.Spend_Country_Code_AFID = n.Spend_Country_Code_AFID
LEFT JOIN ec_outcome_final AS ec_o
  ON o.Customer_Number = ec_o.Customer_Number
  AND o.Product_Name_Final_Merged = ec_o.Product_Name_Final_Merged
  AND o.Billing_Cycle_Updated + 1 = ec_o.Billing_Cycle_Updated
  AND o.Spend_Country_Code_AFID = ec_o.Spend_Country_Code_AFID
LEFT JOIN ec_initial_decline_final AS ec_d
  ON o.Customer_Number = ec_d.Customer_Number
  AND o.Product_Name_Final_Merged = ec_d.Product_Name_Final_Merged
  AND o.Billing_Cycle_Updated + 1 = ec_d.Billing_Cycle_Updated
  AND o.Spend_Country_Code_AFID = ec_d.Spend_Country_Code_AFID
ORDER BY rebill_outcome DESC, o.Customer_Number

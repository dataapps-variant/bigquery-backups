CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.Rebill_Success_Percent_summary` AS
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
    App_Name
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'JF'
    AND Product_Name_Final_Merged = 'JF2788ST'
    AND Billing_Cycle = '3'
    AND Final_Order_Status <> 7
    AND Recurring_Date <> '0000-00-00'
    AND DATE(Recurring_Date) BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 96 DAY) AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
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
    Product_Name_Final_Merged
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'JF'
    AND Product_Name_Final_Merged = 'JF2788ST'
    AND Final_Order_Status <> 7
    AND Date_of_Sale BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 96 DAY) AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
),

ec_outcome AS (
  SELECT 
    Customer_Number,
    Product_Name_Final_Merged,
    Final_Order_Status,
    ROW_NUMBER() OVER (
      PARTITION BY Customer_Number, Product_Name_Final_Merged
      ORDER BY 
        CASE WHEN Final_Order_Status IN (2, 6) THEN 1 ELSE 2 END,
        Date_of_Sale DESC
    ) AS rn
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE App_Name = 'JF'
    AND Product_Name_Final_Merged = 'JF2788ST'
    AND Billing_Cycle_Updated = 4
),

ec_outcome_final AS (
  SELECT 
    Customer_Number,
    Product_Name_Final_Merged,
    Final_Order_Status AS outcome_status
  FROM ec_outcome
  WHERE rn = 1
),

ec_initial_decline AS (
  SELECT 
    Customer_Number,
    Product_Name_Final_Merged,
    Decline_Reason,
    Decline_Reason_Category,
    Fault_Category,
    ROW_NUMBER() OVER (
      PARTITION BY Customer_Number, Product_Name_Final_Merged
      ORDER BY Date_of_Sale DESC
    ) AS rn
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  WHERE App_Name = 'JF'
    AND Product_Name_Final_Merged = 'JF2788ST'
    AND Billing_Cycle_Updated = 4
    AND Retry_Attempt = '0'
),

ec_initial_decline_final AS (
  SELECT 
    Customer_Number,
    Product_Name_Final_Merged,
    Decline_Reason,
    Decline_Reason_Category,
    Fault_Category
  FROM ec_initial_decline
  WHERE rn = 1
),

base_data AS (
  SELECT
    DATE(o.Recurring_Date) AS scheduled_rebill_date,
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
      WHEN n.Order_Id IS NOT NULL THEN 'SUCCESS'
      ELSE COALESCE(ec_d.Decline_Reason, 'Unknown')
    END AS decline_reason,
    CASE 
      WHEN n.Order_Id IS NOT NULL THEN 'SUCCESS'
      ELSE COALESCE(ec_d.Decline_Reason_Category, 'Unknown')
    END AS decline_reason_category,
    CASE 
      WHEN n.Order_Id IS NOT NULL THEN 'SUCCESS'
      ELSE COALESCE(ec_d.Fault_Category, 'Unknown')
    END AS fault_category
  FROM parent_orders AS o
  LEFT JOIN child_exact_match AS n 
    ON o.Order_Id = n.Parent_Order_Id 
    AND DATE(o.Recurring_Date) = n.Date_of_Sale 
    AND o.App_Name = n.App_Name 
    AND o.Product_Name_Final_Merged = n.Product_Name_Final_Merged
  LEFT JOIN ec_outcome_final AS ec_o
    ON o.Customer_Number = ec_o.Customer_Number
    AND o.Product_Name_Final_Merged = ec_o.Product_Name_Final_Merged
  LEFT JOIN ec_initial_decline_final AS ec_d
    ON o.Customer_Number = ec_d.Customer_Number
    AND o.Product_Name_Final_Merged = ec_d.Product_Name_Final_Merged
),

date_level AS (
  SELECT
    scheduled_rebill_date,
    COUNT(*) AS total_scheduled,
    COUNTIF(rebill_outcome = 'SUCCESS') AS rebilled_successfully,
    COUNTIF(rebill_outcome = 'FAILED') AS failed,
    COUNTIF(rebill_outcome = 'FAILED' AND ec_final_order_status IN ('2', '6')) AS failed_renewed,
    COUNTIF(rebill_outcome = 'FAILED' AND (ec_final_order_status = '7' OR ec_final_order_status = 'Not Found')) AS failed_not_renewed,
    ROUND(SAFE_DIVIDE(COUNTIF(rebill_outcome = 'SUCCESS'), COUNT(*)) * 100, 2) AS daily_success_pct,
    SUM(COUNT(*)) OVER (
      ORDER BY scheduled_rebill_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
    ) AS t7d_total,
    SUM(COUNTIF(rebill_outcome = 'SUCCESS')) OVER (
      ORDER BY scheduled_rebill_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
    ) AS t7d_rebilled,
    ROUND(SAFE_DIVIDE(
      SUM(COUNTIF(rebill_outcome = 'SUCCESS')) OVER (
        ORDER BY scheduled_rebill_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
      ),
      SUM(COUNT(*)) OVER (
        ORDER BY scheduled_rebill_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
      )
    ) * 100, 2) AS t7d_success_pct
  FROM base_data
  GROUP BY scheduled_rebill_date
),

reason_level AS (
  SELECT
    scheduled_rebill_date,
    rebill_outcome,
    decline_reason,
    decline_reason_category,
    fault_category,
    COUNT(*) AS order_count
  FROM base_data
  GROUP BY scheduled_rebill_date, rebill_outcome, decline_reason, decline_reason_category, fault_category
)

SELECT
  r.scheduled_rebill_date,
  d.total_scheduled,
  d.rebilled_successfully,
  d.failed,
  d.failed_renewed,
  d.failed_not_renewed,
  d.daily_success_pct,
  d.t7d_total,
  d.t7d_rebilled,
  d.t7d_success_pct,
  r.rebill_outcome,
  r.decline_reason,
  r.decline_reason_category,
  r.fault_category,
  r.order_count,
  CASE 
    WHEN r.rebill_outcome = 'SUCCESS' THEN NULL
    ELSE ROUND(SAFE_DIVIDE(r.order_count, d.failed) * 100, 2)
  END AS pct_of_failed
FROM reason_level AS r
INNER JOIN date_level AS d 
  ON r.scheduled_rebill_date = d.scheduled_rebill_date
WHERE r.scheduled_rebill_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
ORDER BY r.scheduled_rebill_date DESC, r.rebill_outcome DESC, r.order_count DESC

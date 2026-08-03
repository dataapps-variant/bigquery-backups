WITH base_transactions AS (
  -- Step 1: Get last 7000 transactions
  SELECT 
    Date_of_Sale,
    Product_Name_Final_Merged AS Plan_Name,
    Customer_Number,
    Order_Id,
    Date_of_Sale AS Window_Start_Date,
    DATE_ADD(Date_of_Sale, INTERVAL 6 DAY) AS Window_End_Date
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Product_Name_Final_Merged = 'CT2788YT'
    AND Billing_Cycle_Updated = 0
    AND Spend_Country_Code_AFID = "JP"
    AND Date_of_Sale <= DATE_SUB('2026-01-11', INTERVAL 8 DAY)
  ORDER BY Date_of_Sale DESC
  LIMIT 7000
),

refund_records AS (
  -- Step 2: Get all refund records for the same plan
  SELECT 
    Customer_Number,
    Refund_Date,
    Refund_Amount_USD
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Product_Name_Final_Merged = 'CT2788YT'
  AND Spend_Country_Code_AFID = "JP"
    AND Refund_Date IS NOT NULL
)

-- Step 3: Join to find eligible refunds
SELECT 
  bt.Date_of_Sale,
  bt.Plan_Name,
  bt.Customer_Number,
  bt.Order_Id,
  bt.Window_Start_Date,
  bt.Window_End_Date,
  rr.Refund_Date,
  rr.Refund_Amount_USD
FROM base_transactions bt
LEFT JOIN refund_records rr
  ON bt.Customer_Number = rr.Customer_Number
  AND rr.Refund_Date BETWEEN bt.Window_Start_Date AND bt.Window_End_Date

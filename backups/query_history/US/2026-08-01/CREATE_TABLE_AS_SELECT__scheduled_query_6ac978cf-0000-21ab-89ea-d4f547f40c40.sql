-- job_id: scheduled_query_6ac978cf-0000-21ab-89ea-d4f547f40c40
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T10:26:01.680000+00:00
-- started: 2026-08-01T10:26:01.993000+00:00
-- ended: 2026-08-01T10:26:04.767000+00:00

CREATE OR REPLACE TABLE `Sticky_Data.Sales_SS_original_API_Merged_TBL` AS
SELECT 
  s.*,
  a.Product_Name_Final_Main,
  a.Allocation_Percentage,
  s.Plan_Price_USD * a.Allocation_Percentage AS Plan_Price_Allocated_USD,
  s.Order_Total_USD * a.Allocation_Percentage AS Order_Total_Allocated_USD,
  s.Sales_Tax_Amount_USD * a.Allocation_Percentage AS Sales_Tax_Amount_Allocated_USD,
  (s.Order_Price_Net_of_Tax_USD - s.Refund_Amount_USD) * a.Allocation_Percentage AS Order_Price_Net_of_Tax_Allocated_USD,
  s.Plan_Price_Net_of_Tax_USD * a.Allocation_Percentage AS Plan_Price_Net_of_Tax_Allocated_USD,
  COALESCE(vpu.Product_Name_Final_Merged, a.Product_Name_Final_Main) AS Product_Name_Final_Main_Merged
 
FROM `Sticky_Data.Sticky_Dim_SS` a 
LEFT JOIN `Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
  ON a.Product_Name_Final_SS = s.Product_Name_Final  
  AND s.Date_of_Sale BETWEEN a.Start_Date AND a.End_Date
LEFT JOIN `variant-finance-data-project.VPU.VPU_Dim_MergedPlansDetails` vpu
  ON a.Product_Name_Final_Main = vpu.Product_Name_final
  AND s.Date_of_Sale BETWEEN vpu.Start_Date AND vpu.End_Date

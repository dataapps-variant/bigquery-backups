-- job_id: scheduled_query_6ab40560-0000-268c-9e95-ac3eb15e268c
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T05:26:04.587000+00:00
-- started: 2026-08-03T05:26:04.976000+00:00
-- ended: 2026-08-03T05:26:08.183000+00:00

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

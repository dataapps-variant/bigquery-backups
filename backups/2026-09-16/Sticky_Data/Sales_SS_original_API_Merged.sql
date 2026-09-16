CREATE OR REPLACE VIEW `Sticky_Data.Sales_SS_original_API_Merged` AS
SELECT 
  s.*,
  a.Product_Name_Final_Main,
  a.Allocation_Percentage ,
  s.Plan_Price_USD * a.Allocation_Percentage AS Plan_Price_Allocated_USD,
  s.Order_Total_USD * a.Allocation_Percentage AS Order_Total_Allocated_USD,
  s.Sales_Tax_Amount_USD * a.Allocation_Percentage AS         Sales_Tax_Amount_Allocated_USD,
  s.Order_Price_Net_of_Tax_USD * a.Allocation_Percentage AS Order_Price_Net_of_Tax_Allocated_USD,
  s.Plan_Price_Net_of_Tax_USD * a.Allocation_Percentage AS Plan_Price_Net_of_Tax_Allocated_USD
 
FROM Sticky_Data.Sticky_Dim_SS a 
LEFT JOIN Sticky_Data.Sticky_data_API_original_V_Merged  s
 ON a.Product_Name_Final_SS = s.Product_Name_Final  
 AND s.Date_of_Sale BETWEEN a.Start_Date AND a.End_Date

CREATE VIEW `variant-finance-data-project.Sticky_Data.Sales_SS1`
AS WITH Dim_SS_Dedup AS (
    SELECT *
    FROM (
        SELECT 
            a.*,
            ROW_NUMBER() OVER (
                PARTITION BY Product_Name_Final_SS, Start_Date, End_Date
                ORDER BY Start_Date DESC
            ) AS rn
        FROM `Sticky_Data.Sticky_Dim_SS` a
    )
    WHERE rn = 1
)
SELECT 
  s.*,
  d.Product_Name_Final_Main,
  d.Allocation_Percentage,
  s.Plan_Price_USD * d.Allocation_Percentage AS Plan_Price_Allocated_USD,
  s.Order_Total_USD * d.Allocation_Percentage AS Order_Total_Allocated_USD,
  s.Sales_Tax_Amount_USD * d.Allocation_Percentage AS Sales_Tax_Amount_Allocated_USD,
  s.Order_Price_Net_of_Tax_USD * d.Allocation_Percentage AS Order_Price_Net_of_Tax_Allocated_USD,
  s.Plan_Price_Net_of_Tax_USD * d.Allocation_Percentage AS Plan_Price_Net_of_Tax_Allocated_USD
FROM Dim_SS_Dedup d
LEFT JOIN `Sticky_Data.Sticky_Sales_V` s
  ON d.Product_Name_Final_SS = s.Product_Name_Final
 AND s.Date_of_Sale BETWEEN d.Start_Date AND d.End_Date;

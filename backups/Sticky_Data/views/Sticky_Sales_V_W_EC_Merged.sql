CREATE VIEW `variant-finance-data-project.Sticky_Data.Sticky_Sales_V_W_EC_Merged`
AS SELECT * REPLACE(
  CAST(Time_of_Sale AS TIME) AS Time_of_Sale
)
FROM `Sticky_Data.Sticky_Sales_V_AT_W_EC`
UNION ALL
SELECT *  
FROM `Sticky_Data.Sticky_Sales_V_PD_W_EC`
UNION ALL
SELECT * REPLACE(
  CAST(Time_of_Sale AS TIME) AS Time_of_Sale
)
FROM `Sticky_Data.Sticky_Sales_V_CN_W_EC`
UNION ALL
SELECT * REPLACE(
  CAST(Time_of_Sale AS TIME) AS Time_of_Sale
)
FROM `Sticky_Data.Sticky_Sales_V_FS_W_EC`
UNION ALL
SELECT * REPLACE(
  CAST(Time_of_Sale AS TIME) AS Time_of_Sale
)
FROM `Sticky_Data.Sticky_Sales_V_CT_W_EC`
UNION ALL
SELECT * REPLACE(
  CAST(Time_of_Sale AS TIME) AS Time_of_Sale
)
FROM `Sticky_Data.Sticky_Sales_V_JF_W_EC`;

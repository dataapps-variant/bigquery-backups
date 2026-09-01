SELECT 'Bill_Country' AS Field, Bill_Country AS Value FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'Ship_Country', Ship_Country FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'Payment', Payment FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'Campaign_Id', CAST(Campaign_Id AS STRING) FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'Order_Status', Order_Status FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'AFID', CAST(AFID AS STRING) FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'Currency', Currency FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'Gateway_ID_&_Alias', 
CONCAT(CAST(Gateway_Id AS STRING), ' _ ', Gateway_Alias) FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'Product_Details',
CONCAT(CAST(Product_Id AS STRING), ' _ ', Product_Name, ' _ ', CAST(Campaign_Id AS STRING))  FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
UNION DISTINCT
SELECT 'IP_Address_Lookup', IP_Address_Lookup FROM `variant-finance-data-project.Sticky_Data.Sticky_FS`
ORDER BY 
  CASE Field
    WHEN 'Bill_Country' THEN 1
    WHEN 'Ship_Country' THEN 2
    WHEN 'Payment' THEN 3
    WHEN 'Campaign_Id' THEN 4
    WHEN 'Order_Status' THEN 5
    WHEN 'AFID' THEN 6
    WHEN 'Currency' THEN 7
    WHEN 'Gateway_ID_&_Alias' THEN 8
    WHEN 'Product_Details' THEN 9
    ELSE 10
  END,
  Value;

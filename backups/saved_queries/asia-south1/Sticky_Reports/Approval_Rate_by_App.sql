CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Reports.Approval_Rate_by_App` AS

WITH All_Orders AS (
    -- AT
    SELECT 
        CAM.App_Name,
        ATT.Final_Order_Status,
        ATT.Test,
        ATT.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT` ATT
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` CAM
        ON CONCAT('AT_', ATT.Campaign_Id) = CONCAT(CAM.Entity, '_', CAM.Campaign_Id)
    
    UNION ALL
    
    -- PD
    SELECT 
        CAM.App_Name,
        PDD.Final_Order_Status,
        PDD.Test,
        PDD.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` PDD
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` CAM
        ON CONCAT('PD_', PDD.Campaign_Id) = CONCAT(CAM.Entity, '_', CAM.Campaign_Id)
    
    UNION ALL
    
    -- CN
    SELECT 
        CAM.App_Name,
        CNN.Final_Order_Status,
        CNN.Test,
        CNN.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN` CNN
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` CAM
        ON CONCAT('CN_', CNN.Campaign_Id) = CONCAT(CAM.Entity, '_', CAM.Campaign_Id)
    
    UNION ALL
    
    -- FS
    SELECT 
        CAM.App_Name,
        FSS.Final_Order_Status,
        FSS.Test,
        FSS.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS` FSS
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` CAM
        ON CONCAT('FS_', FSS.Campaign_Id) = CONCAT(CAM.Entity, '_', CAM.Campaign_Id)
    
    UNION ALL
    
    -- CT
    SELECT 
        CAM.App_Name,
        CTT.Final_Order_Status,
        CTT.Test,
        CTT.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` CTT
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` CAM
        ON CONCAT('CT_', CTT.Campaign_Id) = CONCAT(CAM.Entity, '_', CAM.Campaign_Id)
    
    UNION ALL
    
    -- JF
    SELECT 
        CAM.App_Name,
        JFF.Final_Order_Status,
        JFF.Test,
        JFF.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` JFF
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` CAM
        ON CONCAT('JF_', JFF.Campaign_Id) = CONCAT(CAM.Entity, '_', CAM.Campaign_Id)
)

SELECT
    Date_of_Sale AS Reporting_Date,
    App_Name,
    COUNTIF(Final_Order_Status = 2) AS Approved_Count,
    COUNTIF(Final_Order_Status = 7) AS RMA_Count,
    COUNT(*) AS Total_Count,
    SAFE_DIVIDE(
        COUNTIF(Final_Order_Status = 2),
        COUNT(*)
    ) AS Approval_Rate,
    SAFE_DIVIDE(
        COUNTIF(Final_Order_Status = 7),
        COUNT(*)
    ) AS RMA_Rate
FROM All_Orders
WHERE Test = '0'
  AND Date_of_Sale >= '2025-01-01'
GROUP BY Date_of_Sale, App_Name
ORDER BY Date_of_Sale DESC, App_Name

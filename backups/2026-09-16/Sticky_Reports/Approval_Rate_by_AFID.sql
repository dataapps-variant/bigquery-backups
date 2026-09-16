CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Reports.Approval_Rate_by_AFID` AS

WITH All_Orders AS (
    -- AT
    SELECT 
        ATT.AFID,
        ATT.Final_Order_Status,
        ATT.Test,
        ATT.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT` ATT
    
    UNION ALL
    
    -- PD
    SELECT 
        PDD.AFID,
        PDD.Final_Order_Status,
        PDD.Test,
        PDD.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` PDD
    
    UNION ALL
    
    -- CN
    SELECT 
        CNN.AFID,
        CNN.Final_Order_Status,
        CNN.Test,
        CNN.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN` CNN
    
    UNION ALL
    
    -- FS
    SELECT 
        FSS.AFID,
        FSS.Final_Order_Status,
        FSS.Test,
        FSS.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS` FSS
    
    UNION ALL
    
    -- CT
    SELECT 
        CTT.AFID,
        CTT.Final_Order_Status,
        CTT.Test,
        CTT.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` CTT
    
    UNION ALL
    
    -- JF
    SELECT 
        JFF.AFID,
        JFF.Final_Order_Status,
        JFF.Test,
        JFF.Date_of_Sale
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` JFF
)

SELECT
    Date_of_Sale AS Reporting_Date,
    AFID,
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
GROUP BY Date_of_Sale, AFID
ORDER BY Date_of_Sale DESC, AFID

-- job_id: scheduled_query_6aa699ba-0000-25d1-8374-d4f547f95ab8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T08:18:06.128000+00:00
-- started: 2026-07-31T08:18:06.961000+00:00
-- ended: 2026-07-31T08:18:25.757000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Verification_55` AS

WITH Individual_Entity_Counts AS (
  SELECT 'AT' AS Entity_Name, COUNT(*) AS Individual_Table_Count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT_W_EC`
  WHERE Final_Order_Status IN (2, 6, 8)
  
  UNION ALL
  
  SELECT 'CN' AS Entity_Name, COUNT(*) AS Individual_Table_Count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN_W_EC`
  WHERE Final_Order_Status IN (2, 6, 8)
  
  UNION ALL
  
  SELECT 'CT' AS Entity_Name, COUNT(*) AS Individual_Table_Count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_W_EC`
  WHERE Final_Order_Status IN (2, 6, 8)
  
  UNION ALL
  
  SELECT 'DT' AS Entity_Name, COUNT(*) AS Individual_Table_Count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_DT_V_W_EC`
  WHERE Final_Order_Status IN (2, 6, 8)
  
  UNION ALL
  
  SELECT 'FS' AS Entity_Name, COUNT(*) AS Individual_Table_Count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS_W_EC`
  WHERE Final_Order_Status IN (2, 6, 8)
  
  UNION ALL
  
  SELECT 'JF' AS Entity_Name, COUNT(*) AS Individual_Table_Count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF_W_EC`
  WHERE Final_Order_Status IN (2, 6, 8)
  
  UNION ALL
  
  SELECT 'PD' AS Entity_Name, COUNT(*) AS Individual_Table_Count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V_W_EC`
  WHERE Final_Order_Status IN (2, 6, 8)
),

Merged_Table_Counts AS (
  SELECT 
    Entity_Name,
    COUNT(*) AS Merged_Table_Count
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Final_Order_Status IN (2, 6, 8)
  GROUP BY Entity_Name
),

Comparison AS (
  SELECT 
    i.Entity_Name,
    i.Individual_Table_Count,
    COALESCE(m.Merged_Table_Count, 0) AS Merged_Table_Count,
    i.Individual_Table_Count - COALESCE(m.Merged_Table_Count, 0) AS Difference,
    CASE 
      WHEN i.Individual_Table_Count = COALESCE(m.Merged_Table_Count, 0) THEN 'MATCH'
      ELSE 'MISMATCH'
    END AS Validation_Status
  FROM Individual_Entity_Counts i
  LEFT JOIN Merged_Table_Counts m
    ON i.Entity_Name = m.Entity_Name
),

Total_Row AS (
  SELECT 
    'TOTAL' AS Entity_Name,
    SUM(Individual_Table_Count) AS Individual_Table_Count,
    SUM(Merged_Table_Count) AS Merged_Table_Count,
    SUM(Difference) AS Difference,
    CASE 
      WHEN SUM(Difference) = 0 THEN 'ALL MATCH'
      ELSE 'HAS MISMATCH'
    END AS Validation_Status
  FROM Comparison
)

SELECT * FROM Comparison
UNION ALL
SELECT * FROM Total_Row
ORDER BY CASE WHEN Entity_Name = 'TOTAL' THEN 1 ELSE 0 END, Entity_Name

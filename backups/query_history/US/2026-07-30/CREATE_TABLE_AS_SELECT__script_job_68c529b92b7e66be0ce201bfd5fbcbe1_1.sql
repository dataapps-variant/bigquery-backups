-- job_id: script_job_68c529b92b7e66be0ce201bfd5fbcbe1_1
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T09:00:10.793000+00:00
-- started: 2026-07-30T09:00:11.057000+00:00
-- ended: 2026-07-30T09:00:12.670000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_SS_Users` AS
WITH 
SS_BC0 AS (
  SELECT 
    CONCAT(
  SUBSTR(Product_Name_Final, 1, 2),
  LPAD(SUBSTR(Product_Name_Final, 3, LENGTH(Product_Name_Final) - 4), 4, '0'),
  RIGHT(Product_Name_Final, 2)
) AS Product_Name_Final,
    FORMAT_DATE('%-m-%-d-%Y', DATE_TRUNC(Date_of_Sale, MONTH)) AS month,
    COUNT(DISTINCT Updated_Cust_ID) AS ss_bc0_users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE RIGHT(Product_Name_Final, 2) = 'SS'
    AND Billing_Cycle_Updated = 0
    AND Date_of_Sale >= '2023-01-01'
    AND Date_of_Sale <= DATE "2026-06-30"
    
  GROUP BY 
  CONCAT(
    SUBSTR(Product_Name_Final, 1, 2),
    LPAD(SUBSTR(Product_Name_Final, 3, LENGTH(Product_Name_Final) - 4), 4, '0'),
    RIGHT(Product_Name_Final, 2)
  ),
  month
)

SELECT * FROM SS_BC0
PIVOT (
  MAX(ss_bc0_users) 
  FOR month IN ('1-1-2023', '2-1-2023', '3-1-2023', '4-1-2023', '5-1-2023', '6-1-2023', '7-1-2023', '8-1-2023', '9-1-2023', '10-1-2023', '11-1-2023', '12-1-2023', '1-1-2024', '2-1-2024', '3-1-2024', '4-1-2024', '5-1-2024', '6-1-2024', '7-1-2024', '8-1-2024', '9-1-2024', '10-1-2024', '11-1-2024', '12-1-2024', '1-1-2025', '2-1-2025', '3-1-2025', '4-1-2025', '5-1-2025', '6-1-2025', '7-1-2025', '8-1-2025', '9-1-2025', '10-1-2025', '11-1-2025', '12-1-2025', '1-1-2026', '2-1-2026', '3-1-2026', '4-1-2026', '5-1-2026', '6-1-2026')
)
ORDER BY Product_Name_Final

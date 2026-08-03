-- job_id: job_QBNKhamX7fEfp8r6QYjmM9yrFUct
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:55:48.564000+00:00
-- started: 2026-07-28T09:55:48.640000+00:00
-- ended: 2026-07-28T09:55:49.372000+00:00

WITH cycle_0_customers AS (
  SELECT DISTINCT Updated_Cust_ID
  FROM (
    SELECT Updated_Cust_ID
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Product_Name_Final_Merged = "PD4988PTAA"
      AND Date_of_Sale <= "2026-03-29"
      AND Billing_Cycle_Updated = 0
      AND AFID_CHANNEL = 15
    ORDER BY Date_of_Sale DESC
    LIMIT 7000
  )
)

SELECT t.*
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` t
INNER JOIN cycle_0_customers c
  ON t.Updated_Cust_ID = c.Updated_Cust_ID
WHERE t.Billing_Cycle_Updated = 1
  AND t.Product_Name_Final_Merged = "PD4988PTAA"

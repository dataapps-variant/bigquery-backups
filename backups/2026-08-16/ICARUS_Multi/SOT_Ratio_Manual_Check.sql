WITH base AS (
  SELECT Updated_Cust_ID, Delay_days_SOT
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Product_Name_Final_Merged = "FS2788NT"
    AND Date_of_Sale <= "2026-05-25"
    AND Billing_Cycle_Updated = 3
    AND Spend_Country_Code_AFID = "US"
  ORDER BY Date_of_Sale DESC
  LIMIT 7000
)
SELECT
  COUNT(*)                                                    AS total_rows,
  COUNTIF(Delay_days_SOT <= 0)                                      AS rows_sot_days_le_0,
  COUNT(DISTINCT Updated_Cust_ID)                            AS distinct_customers,
  COUNT(DISTINCT IF(Delay_days_SOT <= 0, Updated_Cust_ID, NULL))   AS distinct_customers_sot_days_le_0
FROM base;

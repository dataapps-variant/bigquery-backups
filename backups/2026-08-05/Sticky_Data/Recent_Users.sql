DECLARE report_date DATE DEFAULT DATE '2026-03-22';

SELECT COUNT(DISTINCT Updated_Cust_ID)
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE Date_of_Sale >= DATE_SUB(report_date, INTERVAL 6 DAY)
  AND Date_of_Sale <= report_date
  AND App_Name = "FS"
  AND Trial_Type IS NOT NULL
  AND Trial_Type != 'SS'
  AND (
    (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
    OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
  )

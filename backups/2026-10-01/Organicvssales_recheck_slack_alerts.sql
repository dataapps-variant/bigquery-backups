WITH orders AS (
  SELECT 
    Date_of_Sale AS report_date,
    count(1) AS sales, 
    COUNTIF(AFID_CHANNEL = 99) AS organic
  FROM (
    SELECT 
      Date_of_Sale, 
      AFID_CHANNEL
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Date_of_Sale BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 96 DAY) AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
      AND App_Name = 'PD'
      AND Final_Order_Status <> 7 
      AND Billing_Cycle = '0'
  )
  GROUP BY Date_of_Sale
)

SELECT 
  report_date,
  sales,
  organic,
  sales - organic AS paid,
  ROUND(SAFE_DIVIDE(
    SUM(organic) OVER (ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING),
    SUM(sales) OVER (ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING)
  ) * 100, 2) AS t7d_organic_pct,
  SUM(organic) OVER (ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS t7d_organic_count,
  SUM(sales) OVER (ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS t7d_total_sales
FROM orders
WHERE report_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
ORDER BY report_date ASC

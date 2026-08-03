-- job_id: e19a21db-c635-4f66-add2-ce114e6c98a4
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:17.822000+00:00
-- started: 2026-08-02T12:00:17.921000+00:00
-- ended: 2026-08-02T12:00:18.703000+00:00

WITH orders AS (
  SELECT report_date, app_short_name, count(1) AS sales, COUNTIF(afid_channel = 99) AS organic FROM(SELECT Date_of_Sale AS report_date, CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_short_name, COALESCE(Country_Code, 'OR') AS Country_Code, AFID_CHANNEL AS afid_channel FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE Date_of_Sale BETWEEN current_date-120 AND current_date-1 AND App_Name NOT IN ('CN', 'AT', 'IQ') AND Final_Order_Status <> 7 AND Billing_Cycle = '0')
GROUP BY report_date, app_short_name
),
t30d_orders AS (
	SELECT app_short_name AS app, sum(sales) AS t30d_ss FROM orders
	WHERE report_date >= current_date-30
	GROUP BY app_short_name
)

SELECT o.report_date, o.app, o.organic_vs_sales FROM(SELECT report_date, app_short_name AS app,
CASE WHEN sum(sales) OVER(PARTITION BY app_short_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(organic) OVER(PARTITION BY app_short_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(sales) OVER(PARTITION BY app_short_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS organic_vs_sales
FROM orders ORDER BY report_date DESC
) AS o 
LEFT JOIN t30d_orders AS t30d ON o.app = t30d.app 
WHERE o.report_date >= current_date - 90 AND t30d.t30d_ss > 50
ORDER BY o.report_date DESC

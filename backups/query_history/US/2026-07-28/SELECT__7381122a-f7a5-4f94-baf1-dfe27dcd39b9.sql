-- job_id: 7381122a-f7a5-4f94-baf1-dfe27dcd39b9
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:00:35.034000+00:00
-- started: 2026-07-28T12:00:35.135000+00:00
-- ended: 2026-07-28T12:00:37.061000+00:00

SELECT report_date, app_name, cancel_rate FROM (
	SELECT app_name, report_date, CASE WHEN sum(orders) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) > 0 THEN (sum(cancels) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) / NULLIF(sum(orders) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING), 0)) ELSE NULL END AS cancel_rate,
	sum(orders) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_orders,
	sum(cancels) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_cancels
	FROM (SELECT report_date, app_name, count(1) AS orders, COUNTIF(hold_date <= report_date+1) AS cancels FROM (
	SELECT report_date, app_name, hold_date FROM (
		SELECT CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_name, Date_of_Sale AS report_date, CASE WHEN Hold_Date = '' THEN NULL ELSE DATE(Hold_Date) END AS hold_date
		FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
		WHERE Date_of_Sale BETWEEN current_date - 96 AND current_date-1 AND Final_Order_Status <> 7 AND Billing_Cycle = '0' AND App_Name NOT IN ('CN', 'AT', 'IQ') AND Trial_Type != 'SS'
	) AS o 
) AS d
GROUP BY report_date, app_name
ORDER BY report_date DESC) AS d
) AS d WHERE report_date >= current_date-90 AND total_orders > 50

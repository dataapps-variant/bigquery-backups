-- job_id: ee1fc43a-3526-4b87-b3f0-8f5e95102f75
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:33.529000+00:00
-- started: 2026-08-01T12:00:33.616000+00:00
-- ended: 2026-08-01T12:00:34.223000+00:00

WITH all_data AS (
	SELECT Date_of_Sale AS report_date, CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_name, countif(Billing_Cycle_Updated > 0) AS rebills, countif(Billing_Cycle_Updated = 0) AS trials
		FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
		WHERE Date_of_Sale BETWEEN current_date - 126 AND current_date-1 AND Final_Order_Status <> 7 AND App_Name NOT IN ('CN', 'AT', 'IQ')
    GROUP BY Date_of_Sale, App_Name
),
hold_data AS (
	SELECT CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_name, DATE(Hold_Date) AS hold_date
		FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
		WHERE Hold_Date != '' AND DATE(Hold_Date) BETWEEN current_date - 96 AND current_date-1 AND Final_Order_Status <> 7 AND Billing_Cycle_Updated > 0 AND App_Name NOT IN ('CN', 'AT', 'IQ')
),
calc AS (SELECT d.report_date, d.App_Name AS app_name, d.rebills AS orders, COALESCE(c.total_cancels, 0) AS cancels FROM all_data AS d
LEFT JOIN (SELECT app_name, hold_date, count(1) AS total_cancels FROM hold_data GROUP BY app_name, hold_date) AS c ON d.report_date = c.hold_date AND d.App_Name = c.app_name
WHERE rebills >= 25
ORDER BY d.report_date DESC, App_Name ASC),
final AS (
	SELECT report_date, app_name, CASE WHEN sum(orders) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) > 0 THEN (sum(cancels) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) / NULLIF(sum(orders) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING), 0)) ELSE NULL END AS cancel_rate,
	sum(orders) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_orders,
	sum(cancels) OVER(PARTITION BY app_name ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_cancels
	FROM calc
	WHERE report_date >= current_date-96
	ORDER BY report_date DESC, app_name ASC
)

SELECT report_date, app_name, cancel_rate FROM final WHERE report_date >= current_date-90

-- job_id: f49ad768-0173-4437-9dcb-3d3d183a054f
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:16.863000+00:00
-- started: 2026-08-01T12:00:17.008000+00:00
-- ended: 2026-08-01T12:00:18.051000+00:00

WITH active_plans AS (
  SELECT app_short_name, count(1) AS active_plans FROM (
SELECT CASE WHEN App_Name = 'CT-JP' THEN 'CT - JP' WHEN App_Name = 'CT-Non-JP' THEN 'CT - US' ELSE App_Name END AS app_short_name, Product_Name_Final AS plan, max(T30D_New_Users) AS subs_count_t30d FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table` WHERE Report_date = current_date-1 AND Billing_Cycle <= 1 GROUP BY App_Name, Product_Name_Final
  ) AS d
  WHERE d.subs_count_t30d > 50
  GROUP BY app_short_name
)
SELECT app_name, plan, recurring_date, billing_cycle, rebill_pcent FROM (
	SELECT app_name, plan, recurring_date, billing_cycle, CASE WHEN sum(orders) OVER(PARTITION BY app_name, plan, billing_cycle ORDER BY recurring_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) > 0 THEN (sum(rebills) OVER(PARTITION BY app_name, plan, billing_cycle ORDER BY recurring_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) / NULLIF(sum(orders) OVER(PARTITION BY app_name, plan, billing_cycle ORDER BY recurring_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING), 0)) ELSE NULL END AS rebill_pcent,
	sum(orders) OVER(PARTITION BY app_name, plan, billing_cycle ORDER BY recurring_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_orders,
	sum(rebills) OVER(PARTITION BY app_name, plan, billing_cycle ORDER BY recurring_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_rebills
	FROM (SELECT recurring_date, app_name, plan, billing_cycle, count(*) AS orders, COUNTIF(rebill_date IS NOT NULL) AS rebills FROM (
	SELECT o.customer_id, o.recurring_date, o.app_name, o.plan, n.order_date AS rebill_date, CASE WHEN CAST(o.billing_cycle AS INT64) >= 5 THEN 6 ELSE CAST(o.billing_cycle AS INT64) + 1 END AS billing_cycle FROM (
		SELECT CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Spend_Country_Code_AFID, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_name, Product_Name_Final_Merged AS plan, Order_Id AS order_id, Customer_Number AS customer_id, Date_of_Sale AS order_date, DATE(Recurring_Date) AS recurring_date, Billing_Cycle AS billing_cycle 
		FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
		WHERE DATE(Recurring_Date) >= current_date - 96 AND DATE(Recurring_Date) < current_date AND Final_Order_Status <> 7 AND Recurring_Date <> '0000-00-00' AND App_Name NOT IN ('CN', 'AT', 'IQ')
	) AS o 
	LEFT JOIN (
		SELECT CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Spend_Country_Code_AFID, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_name, Product_Name_Final_Merged AS plan, Order_Id, Parent_Order_Id, Customer_Number AS customer_id, Date_of_Sale AS order_date, recurring_date, Billing_Cycle AS billing_cycle 
		FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
		WHERE Date_of_Sale >= current_date - 96 AND Final_Order_Status <> 7 AND App_Name NOT IN ('CN', 'AT', 'IQ')
	) AS n ON o.Order_Id = n.Parent_Order_Id AND o.recurring_date = n.order_date AND o.app_name = n.app_name AND o.plan = n.plan
) AS d
GROUP BY recurring_date, app_name, plan, billing_cycle
ORDER BY recurring_date DESC, billing_cycle ASC) AS d
) AS d WHERE recurring_date >= current_date-90 AND total_orders > 50 AND app_name IN (SELECT app_short_name FROM active_plans WHERE active_plans.active_plans > 1)

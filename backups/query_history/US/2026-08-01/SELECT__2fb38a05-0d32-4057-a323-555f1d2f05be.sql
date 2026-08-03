-- job_id: 2fb38a05-0d32-4057-a323-555f1d2f05be
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:21.636000+00:00
-- started: 2026-08-01T12:00:21.989000+00:00
-- ended: 2026-08-01T12:00:24.833000+00:00

(SELECT dd.* FROM(SELECT 'PD' AS app, order_date AS report_date, t_type, CASE WHEN sum(total) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate FROM (
SELECT order_date, t_type, count(*) AS total, countif(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'CIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'PD') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96
	UNION ALL
	SELECT * FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'MIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'PD') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, t_type ORDER BY order_date DESC) AS d) AS dd WHERE report_date >= current_date - 90)
UNION ALL
(SELECT dd.* FROM(SELECT 'FS' AS app, order_date AS report_date, t_type, CASE WHEN sum(total) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate FROM (
SELECT order_date, t_type, count(*) AS total, countif(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'CIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'FS') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96
	UNION ALL
	SELECT * FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'MIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS` 
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'FS') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, t_type ORDER BY order_date DESC) AS d) AS dd WHERE report_date >= current_date - 90)
UNION ALL
(SELECT dd.* FROM(SELECT 'CT - ' || country AS app, order_date AS report_date, t_type, CASE WHEN sum(total) OVER(PARTITION BY country, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY country, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY country, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate FROM (
SELECT order_date, country, t_type, count(*) AS total, countif(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'CIT' AS t_type, CASE WHEN COALESCE(NULLIF(a.Country_Code, 'OR'), Bill_Country) = 'JP' THEN 'JP' ELSE 'US' END AS country FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` AS o
	LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON o.AFID = a.AFID
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'CT') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96
	UNION ALL
	SELECT * FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'MIT' AS t_type, CASE WHEN COALESCE(NULLIF(a.Country_Code, 'OR'), Bill_Country) = 'JP' THEN 'JP' ELSE 'US' END AS country FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` AS o
	LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON o.AFID = a.AFID
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'CT') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, country, t_type ORDER BY order_date DESC) AS d) AS dd WHERE report_date >= current_date - 90)
UNION ALL
(SELECT dd.* FROM(SELECT 'EN' AS app, order_date AS report_date, t_type, CASE WHEN sum(total) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate FROM (
SELECT order_date, t_type, count(*) AS total, countif(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'CIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'EN') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96
	UNION ALL
	SELECT * FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'MIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` 
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'EN') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, t_type ORDER BY order_date DESC) AS d) AS dd WHERE report_date >= current_date - 90)
UNION ALL
(SELECT dd.* FROM(SELECT app_name AS app, order_date AS report_date, t_type, CASE WHEN sum(total) OVER(PARTITION BY app_name, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY app_name, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY app_name, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate FROM (
SELECT order_date, app_name, t_type, count(*) AS total, countif(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'CIT' AS t_type, COALESCE(CASE WHEN AF.JF_App_Name IS NOT NULL AND TRIM(AF.JF_App_Name) != '' AND UPPER(TRIM(AF.JF_App_Name)) != 'COMBINED' THEN AF.JF_App_Name ELSE NULL END, CAM.App_Name, 'JF') AS app_name FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` AS d
	LEFT JOIN Sticky_Data.Sticky_Dim_AFID AS AF ON d.AFID = AF.AFID
LEFT JOIN Sticky_Data.Sticky_Dim_Campaign AS CAM ON d.Campaign_Id = CAM.Campaign_Id AND CAM.Entity = 'JF'
	WHERE d.campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE Entity = 'JF') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96
	UNION ALL
	SELECT * FROM (
	(SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, 'MIT' AS t_type, COALESCE(CASE WHEN AF.JF_App_Name IS NOT NULL AND TRIM(AF.JF_App_Name) != '' AND UPPER(TRIM(AF.JF_App_Name)) != 'COMBINED' THEN AF.JF_App_Name ELSE NULL END, CAM.App_Name, 'JF') AS app_name FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` AS d
	LEFT JOIN Sticky_Data.Sticky_Dim_AFID AS AF ON d.AFID = AF.AFID
LEFT JOIN Sticky_Data.Sticky_Dim_Campaign AS CAM ON d.Campaign_Id = CAM.Campaign_Id AND CAM.Entity = 'JF'
	WHERE d.campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE Entity = 'JF') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30 
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC)
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, app_name, t_type ORDER BY order_date DESC) AS d) AS dd WHERE report_date >= current_date - 90)

-- job_id: 8067218a-9b88-4f15-8a10-f73f056b187a
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:29.005000+00:00
-- started: 2026-08-03T12:00:29.365000+00:00
-- ended: 2026-08-03T12:00:35.995000+00:00

(SELECT 'PD' AS app, order_date AS report_date, afid, t_type, approval_rate FROM(SELECT *, CASE WHEN sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate, max(r) over(PARTITION BY afid, t_type) < 21 AS fresh FROM (
SELECT *, rank() over(PARTITION BY afid, t_type ORDER BY order_date DESC) AS r FROM (
SELECT *, sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_t7d FROM(
SELECT order_date, afid, t_type, count(*) AS total, COUNTIF(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, AFID AS afid, 'CIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'PD') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96 AND AFID <> ''
	UNION ALL
	SELECT * FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, AFID AS afid, 'MIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'PD') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30 AND AFID <> ''
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, afid, t_type ORDER BY order_date DESC) AS with_total) AS ranked WHERE total_t7d >= 35) AS d) AS dd WHERE order_date >= current_date-90 AND NOT fresh)
UNION ALL
(SELECT 'FS' AS app, order_date AS report_date, afid, t_type, approval_rate FROM(SELECT *, CASE WHEN sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate, max(r) over(PARTITION BY afid, t_type) < 21 AS fresh FROM (
SELECT *, rank() over(PARTITION BY afid, t_type ORDER BY order_date DESC) AS r FROM (
SELECT *, sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_t7d FROM(
SELECT order_date, afid, t_type, count(*) AS total, COUNTIF(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, AFID AS afid, 'CIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'FS') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96 AND AFID <> ''
	UNION ALL
	SELECT * FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, AFID AS afid, 'MIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS` 
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'FS') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30 AND AFID <> ''
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, afid, t_type ORDER BY order_date DESC) AS with_total) AS ranked WHERE total_t7d >= 35) AS d) AS dd WHERE order_date >= current_date-90 AND NOT fresh)
UNION ALL
(SELECT 'CT - ' || country AS app, order_date AS report_date, afid, t_type, approval_rate FROM(SELECT *, CASE WHEN sum(total) OVER(PARTITION BY country, afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY country, afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY country, afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate, max(r) over(PARTITION BY country, afid, t_type) < 21 AS fresh FROM (
SELECT *, rank() over(PARTITION BY country, afid, t_type ORDER BY order_date DESC) AS r FROM (
SELECT *, sum(total) OVER(PARTITION BY country, afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_t7d FROM(
SELECT order_date, country, afid, t_type, count(*) AS total, COUNTIF(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, o.AFID AS afid, 'CIT' AS t_type, CASE WHEN COALESCE(NULLIF(a.Country_Code, 'OR'), Bill_Country) = 'JP' THEN 'JP' ELSE 'US' END AS country FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` AS o
	LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON o.AFID = a.AFID
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'CT') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96 AND o.AFID <> ''
	UNION ALL
	SELECT * FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, o.AFID AS afid, 'MIT' AS t_type, CASE WHEN COALESCE(NULLIF(a.Country_Code, 'OR'), Bill_Country) = 'JP' THEN 'JP' ELSE 'US' END AS country FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` AS o
	LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON o.AFID = a.AFID
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'CT') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30 AND o.AFID <> ''
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, country, afid, t_type ORDER BY order_date DESC) AS with_total) AS ranked WHERE total_t7d >= 35) AS d) AS dd WHERE order_date >= current_date-90 AND NOT fresh)
UNION ALL
(SELECT 'EN' AS app, order_date AS report_date, afid, t_type, approval_rate FROM(SELECT *, CASE WHEN sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate, max(r) over(PARTITION BY afid, t_type) < 21 AS fresh FROM (
SELECT *, rank() over(PARTITION BY afid, t_type ORDER BY order_date DESC) AS r FROM (
SELECT *, sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_t7d FROM(
SELECT order_date, afid, t_type, count(*) AS total, COUNTIF(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, AFID AS afid, 'CIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'EN') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96 AND AFID <> ''
	UNION ALL
	SELECT * FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, AFID AS afid, 'MIT' AS t_type FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` 
	WHERE campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'EN') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30 AND AFID <> ''
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, afid, t_type ORDER BY order_date DESC) AS with_total) AS ranked WHERE total_t7d >= 35) AS d) AS dd WHERE order_date >= current_date-90 AND NOT fresh)
UNION ALL
(SELECT app_name AS app, order_date AS report_date, afid, t_type, approval_rate FROM(SELECT *, CASE WHEN sum(total) OVER(PARTITION BY app_name, afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) = 0 THEN NULL ELSE
sum(success) OVER(PARTITION BY app_name, afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) /
sum(total) OVER(PARTITION BY app_name, afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) END AS approval_rate, max(r) over(PARTITION BY afid, t_type) < 21 AS fresh FROM (
SELECT *, rank() over(PARTITION BY app_name, afid, t_type ORDER BY order_date DESC) AS r FROM (
SELECT *, sum(total) OVER(PARTITION BY afid, t_type ORDER BY order_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS total_t7d FROM(
SELECT order_date, app_name, afid, t_type, count(*) AS total, COUNTIF(order_status <> 7) AS success
FROM (
	SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, d.AFID AS afid, 'CIT' AS t_type, COALESCE(CASE WHEN AF.JF_App_Name IS NOT NULL AND TRIM(AF.JF_App_Name) != '' AND UPPER(TRIM(AF.JF_App_Name)) != 'COMBINED' THEN AF.JF_App_Name ELSE NULL END, CAM.App_Name, 'JF') AS app_name FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` AS d
	LEFT JOIN Sticky_Data.Sticky_Dim_AFID AS AF ON d.AFID = AF.AFID
LEFT JOIN Sticky_Data.Sticky_Dim_Campaign AS CAM ON d.Campaign_Id = CAM.Campaign_Id AND CAM.Entity = 'JF'
	WHERE d.campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE Entity = 'JF') AND billing_cycle = '0' AND Date_of_Sale >= current_date - 96 AND d.AFID <> ''
	UNION ALL
	SELECT * FROM (
	(SELECT Date_of_Sale AS order_date, Final_Order_Status AS order_status, d.AFID AS afid, 'MIT' AS t_type, COALESCE(CASE WHEN AF.JF_App_Name IS NOT NULL AND TRIM(AF.JF_App_Name) != '' AND UPPER(TRIM(AF.JF_App_Name)) != 'COMBINED' THEN AF.JF_App_Name ELSE NULL END, CAM.App_Name, 'JF') AS app_name FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` AS d
	LEFT JOIN Sticky_Data.Sticky_Dim_AFID AS AF ON d.AFID = AF.AFID
LEFT JOIN Sticky_Data.Sticky_Dim_Campaign AS CAM ON d.Campaign_Id = CAM.Campaign_Id AND CAM.Entity = 'JF'
	WHERE d.campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE Entity = 'JF') AND CAST(billing_cycle AS INT64) > 0 AND Date_of_Sale >= current_date - 96 - 30 AND d.AFID <> ''
	QUALIFY ROW_NUMBER() OVER(PARTITION BY Customer_Number, billing_cycle ORDER BY Order_Id ASC) = 1
	ORDER BY Customer_Number, Billing_Cycle, Order_Id ASC)
	) AS mit_orders WHERE order_date >= current_date - 96
) AS orders 
WHERE order_date <> current_date
GROUP BY order_date, app_name, afid, t_type ORDER BY order_date DESC) AS with_total) AS ranked WHERE total_t7d >= 35) AS d) AS dd WHERE order_date >= current_date-90 AND NOT fresh)

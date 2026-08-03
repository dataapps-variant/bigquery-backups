-- job_id: 87b4af5c-69a0-4877-b952-48947581ac77
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:19:30.183000+00:00
-- started: 2026-07-31T12:19:30.472000+00:00
-- ended: 2026-07-31T12:19:33.122000+00:00


    WITH order_data AS (
    SELECT report_date, t_type, decline_reason, count(*) AS count FROM(
    SELECT * FROM (
    SELECT sjo.Order_Id AS order_id, Bill_Email AS email_address, sjo.Date_of_Sale AS report_date, CASE WHEN Billing_Cycle = '0' THEN 'CIT' ELSE 'MIT' END AS t_type, regexp_replace(sjo.Decline_Reason, r'(Unable to authorize payment for payment method ([0-9]*); Transaction Id: ([0-9]*)\.)|(Transaction ID = ([A-Z0-9]*))|(REFID:([0-9]*))', '') AS decline_reason FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` AS sjo
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON sjo.AFID = a.AFID
    WHERE Final_Order_Status = 7 AND Date_of_Sale BETWEEN DATE(DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 60 DAY), HOUR)) AND DATE(DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 DAY), HOUR)) AND Campaign_Id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'CT') AND COALESCE(a.Country_Code, sjo.Bill_Country) <> 'JP'
    ) AS distinct_orders
    QUALIFY ROW_NUMBER() OVER(PARTITION BY email_address, report_date, t_type, decline_reason) = 1
    ) AS recent_orders
    GROUP BY report_date, t_type, decline_reason
),
calc_data AS (
    SELECT dg.report_date, dg.t_type, dg.decline_reason, MAX(dg.count) AS amount, CAST(MAX(dg.count) AS DECIMAL) / MAX(fd.total) AS decline_percent, MAX(fd.total) AS total_fails FROM order_data AS dg
    LEFT JOIN (SELECT report_date, t_type, sum(count) AS total from order_data GROUP BY report_date, t_type) AS fd ON dg.report_date = fd.report_date AND dg.t_type = fd.t_type
    GROUP BY dg.report_date, dg.t_type, dg.decline_reason
),
all_hours AS (
    SELECT * FROM (
    SELECT ROW_NUMBER() OVER (PARTITION BY t_type, decline_reason ORDER BY report_date DESC) AS r, ad.* FROM (
    SELECT *, count(*) OVER(PARTITION BY t_type, decline_reason) AS total_occurances FROM calc_data
    WHERE total_fails > 20
    ) AS ad
    ) AS rd WHERE  r <= 14
),
calc_squares AS (
    SELECT ad.report_date, ad.t_type, ad.decline_reason, td.trailing_value AS mean, power(ad.decline_percent - td.trailing_value, 2) AS square FROM all_hours AS ad
    LEFT JOIN (SELECT t_type, decline_reason, sum(decline_percent) / count(*) AS trailing_value FROM all_hours GROUP BY t_type, decline_reason) AS td ON ad.t_type = td.t_type AND ad.decline_reason = td.decline_reason
    ORDER BY report_date ASC
),
calc_variance AS (
    SELECT t_type, decline_reason, sum(square) / count(*) AS variance, sqrt(sum(square) / count(*)) AS std_devi, max(mean) AS mean 
    FROM calc_squares
    GROUP BY t_type, decline_reason
),
control_chart AS (
    SELECT ad.report_date, ad.t_type, ad.decline_reason, ad.amount, ad.decline_percent, lag(ad.decline_percent) OVER (PARTITION BY ad.t_type, ad.decline_reason ORDER BY report_date ASC) AS lag, ad.total_occurances, dd.num_days, cv.mean, 
    cv.std_devi + cv.mean AS one_sigma, cv.std_devi * 2 + cv.mean AS two_sigma, cv.std_devi * 3 + cv.mean AS three_sigma,
    cv.std_devi * -1 + cv.mean AS low_one_sigma, cv.std_devi * -2 + cv.mean AS low_two_sigma, cv.std_devi * -3 + cv.mean AS low_three_sigma 
    FROM all_hours AS ad
    LEFT JOIN calc_variance AS cv ON ad.t_type = cv.t_type AND ad.decline_reason = cv.decline_reason
    LEFT JOIN (SELECT t_type, max(r) AS num_days FROM all_hours GROUP BY t_type) AS dd ON ad.t_type = dd.t_type
    ORDER BY report_date ASC
),
chart_data AS ( 
    SELECT t_type, decline_reason, TO_JSON_STRING(ARRAY_AGG(STRUCT(report_date AS date, ROUND(count, 4) AS value) ORDER BY report_date DESC)) AS chart_data FROM (
        SELECT t_type, decline_reason, report_date, decline_percent AS count FROM all_hours
    ) AS d GROUP BY t_type, decline_reason
)

SELECT d.*, coalesce(app_ranks.alert_level, 0) AS app_priority, coalesce(app_ranks.subs_count_t30d, 0) AS subs_count_t30d, chart.chart_data FROM (
SELECT 'CT - US' AS app, 'change' AS alert, t_type, decline_reason, decline_percent, amount, mean, two_sigma, three_sigma FROM control_chart WHERE report_date = DATE(DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 DAY), HOUR)) AND decline_percent >= 0.05 AND (decline_percent > two_sigma AND lag > two_sigma OR decline_percent > three_sigma)
UNION ALL
SELECT 'CT - US' AS app, 'new' AS alert, t_type, decline_reason, decline_percent, amount, mean, two_sigma, three_sigma FROM control_chart WHERE report_date = DATE(DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 DAY), HOUR)) AND decline_percent >= 0.1 AND (lag < 0.1 OR lag IS NULL) AND total_occurances <= 3 AND num_days <> total_occurances
) AS d
LEFT JOIN (SELECT app, rank() over(ORDER BY subs_count_t30d DESC) AS rank, alert_level, subs_count_t30d FROM (
SELECT app_short_name AS app, sum(subs_count_t30d) AS subs_count_t30d,
CASE WHEN sum(subs_count_t30d) > 25000 THEN 4 WHEN sum(subs_count_t30d) > 10000 THEN 3 WHEN sum(subs_count_t30d) > 5000 THEN 2 WHEN sum(subs_count_t30d) > 2000 THEN 1 ELSE 0 END AS alert_level
FROM (SELECT app_short_name, sum(subs_count_t30d) AS subs_count_t30d FROM (
SELECT CASE WHEN App_Name = 'CT' THEN CASE WHEN Spend_Country_Code_AFID = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_short_name, Spend_Country_Code_AFID AS country_code, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
GROUP BY App_Name, Spend_Country_Code_AFID)
GROUP BY app_short_name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC) AS app_ranks ON app_ranks.app = 'CT - US'
LEFT JOIN chart_data AS chart ON d.t_type = chart.t_type AND d.decline_reason = chart.decline_reason

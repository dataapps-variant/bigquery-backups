-- job_id: 5c40501d-ed47-4ddc-9cd0-8c4b86bca222
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:15:22.111000+00:00
-- started: 2026-07-29T12:15:22.339000+00:00
-- ended: 2026-07-29T12:15:24.980000+00:00


    WITH order_data AS (
    SELECT report_date, afid, t_type, decline_reason, count(*) AS count FROM(
    SELECT * FROM (
    SELECT Order_Id AS order_id, Bill_Email AS email_address, Date_of_Sale AS report_date, AFID AS afid, CASE WHEN Billing_Cycle = '0' THEN 'CIT' ELSE 'MIT' END AS t_type, regexp_replace(Decline_Reason, r'(Unable to authorize payment for payment method ([0-9]*); Transaction Id: ([0-9]*)\.)|(Transaction ID = ([A-Z0-9]*))|(REFID:([0-9]*))', '') AS decline_reason FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
    WHERE Final_Order_Status = 7 AND AFID <> '' AND Date_of_Sale BETWEEN DATE(DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 60 DAY), HOUR)) AND DATE(DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 DAY), HOUR)) AND Campaign_Id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'PD')
    ) AS distinct_orders
    QUALIFY ROW_NUMBER() OVER(PARTITION BY email_address, report_date, t_type, decline_reason, afid) = 1
    ) AS recent_orders
    GROUP BY report_date, afid, t_type, decline_reason
),
calc_data AS (
    SELECT dg.report_date, dg.afid, dg.t_type, dg.decline_reason, MAX(dg.count) AS amount, CAST(MAX(dg.count) AS DECIMAL) / MAX(fd.total) AS decline_percent, MAX(fd.total) AS total_fails FROM order_data AS dg
    LEFT JOIN (SELECT report_date, afid, t_type, sum(count) AS total from order_data GROUP BY report_date, afid, t_type) AS fd ON dg.report_date = fd.report_date AND dg.afid = fd.afid AND dg.t_type = fd.t_type
    GROUP BY dg.report_date, dg.afid, dg.t_type, dg.decline_reason
),
all_hours AS (
    SELECT * FROM (
    SELECT ROW_NUMBER() OVER (PARTITION BY afid, t_type, decline_reason ORDER BY report_date DESC) AS r, ad.* FROM (
    SELECT *, count(*) OVER(PARTITION BY afid, t_type, decline_reason) AS total_occurances FROM calc_data
    WHERE total_fails > 20
    ) AS ad
    ) AS rd WHERE  r <= 14
),
calc_squares AS (
    SELECT ad.report_date, ad.afid, ad.t_type, ad.decline_reason, td.trailing_value AS mean, power(ad.decline_percent - td.trailing_value, 2) AS square FROM all_hours AS ad
    LEFT JOIN (SELECT afid, t_type, decline_reason, sum(decline_percent) / count(*) AS trailing_value FROM all_hours GROUP BY afid, t_type, decline_reason) AS td ON ad.afid = td.afid AND ad.t_type = td.t_type AND ad.decline_reason = td.decline_reason
    ORDER BY report_date ASC
),
calc_variance AS (
    SELECT afid, t_type, decline_reason, sum(square) / count(*) AS variance, sqrt(sum(square) / count(*)) AS std_devi, max(mean) AS mean 
    FROM calc_squares
    GROUP BY afid, t_type, decline_reason
),
control_chart AS (
    SELECT ad.report_date, ad.afid, ad.t_type, ad.decline_reason, ad.amount, ad.decline_percent, lag(ad.decline_percent) OVER (PARTITION BY ad.afid, ad.t_type, ad.decline_reason ORDER BY report_date ASC) AS lag, ad.total_occurances, dd.num_days, cv.mean, 
    cv.std_devi + cv.mean AS one_sigma, cv.std_devi * 2 + cv.mean AS two_sigma, cv.std_devi * 3 + cv.mean AS three_sigma,
    cv.std_devi * -1 + cv.mean AS low_one_sigma, cv.std_devi * -2 + cv.mean AS low_two_sigma, cv.std_devi * -3 + cv.mean AS low_three_sigma 
    FROM all_hours AS ad
    LEFT JOIN calc_variance AS cv ON ad.t_type = cv.t_type AND ad.decline_reason = cv.decline_reason AND ad.afid = cv.afid
    LEFT JOIN (SELECT afid, t_type, max(r) AS num_days FROM all_hours GROUP BY afid, t_type) AS dd ON ad.afid = dd.afid AND ad.t_type = dd.t_type
    ORDER BY report_date ASC
),
chart_data AS ( 
    SELECT afid, t_type, decline_reason, TO_JSON_STRING(ARRAY_AGG(STRUCT(report_date AS date, ROUND(count, 4) AS value) ORDER BY report_date DESC)) AS chart_data FROM (
        SELECT afid, t_type, decline_reason, report_date, decline_percent AS count FROM all_hours
    ) AS d GROUP BY afid, t_type, decline_reason
)

SELECT d.*, coalesce(app_ranks.alert_level, 0) AS app_priority, coalesce(z.subs_count_t30d, 0) AS subs_count_t30d, chart.chart_data FROM (
SELECT 'PD' AS app, afid, t_type, 'change' AS alert, decline_reason, decline_percent, amount, mean, two_sigma, three_sigma, num_days < 8 AS fresh FROM control_chart WHERE report_date = DATE(DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 DAY), HOUR)) AND decline_percent >= 0.05 AND (decline_percent > two_sigma AND lag > two_sigma OR decline_percent > three_sigma)
UNION ALL
SELECT 'PD' AS app, afid, t_type, 'new' AS alert, decline_reason, decline_percent, amount, mean, two_sigma, three_sigma, num_days < 8 AS fresh FROM control_chart WHERE report_date = DATE(DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 DAY), HOUR)) AND decline_percent >= 0.1 AND (lag < 0.1 OR lag IS NULL) AND total_occurances <= 3
) AS d
LEFT JOIN (SELECT app, rank() over(ORDER BY subs_count_t30d DESC) AS rank, alert_level, subs_count_t30d FROM (
SELECT app_short_name AS app, sum(subs_count_t30d) AS subs_count_t30d,
CASE WHEN sum(subs_count_t30d) > 25000 THEN 4 WHEN sum(subs_count_t30d) > 10000 THEN 3 WHEN sum(subs_count_t30d) > 5000 THEN 2 WHEN sum(subs_count_t30d) > 2000 THEN 1 ELSE 0 END AS alert_level
FROM (SELECT App_Name AS app_short_name, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
GROUP BY App_Name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC) AS app_ranks ON app_ranks.app = 'PD'
LEFT JOIN (SELECT d.afid_name AS afid, d.subs AS subs_count_t30d FROM (SELECT AFID AS afid_name, count(*) AS subs FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0' AND App_Name IN ('PD') AND Trial_Type <> 'SS' AND AFID <> '' AND Date_of_Sale >= current_date - 30 GROUP BY AFID) AS d) AS z ON d.afid = z.afid
LEFT JOIN chart_data AS chart ON d.afid = chart.afid AND d.t_type = chart.t_type AND d.decline_reason = chart.decline_reason

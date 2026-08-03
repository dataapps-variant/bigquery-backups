-- job_id: 7cd83244-7de8-433a-9229-d81d7ad65ecc
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: None
-- created: 2026-07-29T15:17:19.755000+00:00
-- started: 2026-07-29T15:17:19.766000+00:00
-- ended: 2026-07-29T15:17:19.766000+00:00


    WITH status_count AS (
    SELECT time_stamp, order_id, customer_id, email_address, order_status, regexp_replace(decline_reason, r'(Unable to authorize payment for payment method ([0-9]*); Transaction Id: ([0-9]*)\.)|(Transaction ID = ([A-Z0-9]*))|(REFID:([0-9]*))', '') AS decline_reason, CASE WHEN order_status = 2 THEN 0 ELSE row_number() OVER (PARTITION BY grp ORDER BY time_stamp ASC, order_id ASC) END AS consecutive FROM (
    SELECT count(rst) OVER (ORDER BY time_stamp ASC, order_id ASC) AS grp, * FROM (
    SELECT CASE WHEN order_status <> lag(order_status) OVER (ORDER BY time_stamp ASC, order_id ASC) THEN 1 END AS rst, * FROM (
    SELECT CAST(time_stamp AS TIMESTAMP) AS time_stamp, CAST(customer_id AS INTEGER) AS customer_id, email_address, CAST(order_id AS INTEGER) AS order_id, CAST(order_status AS INTEGER) AS order_status, decline_reason FROM (SELECT COALESCE(CASE WHEN AF.JF_App_Name IS NOT NULL AND TRIM(AF.JF_App_Name) != '' AND UPPER(TRIM(AF.JF_App_Name)) != 'COMBINED' THEN AF.JF_App_Name ELSE NULL END, CAM.App_Name, 'JF') AS app, o.* FROM `variant-finance-data-project.Sticky_Data.test_Sticky_data_API_original_JF_Incremental` AS o
    LEFT JOIN Sticky_Data.Sticky_Dim_AFID AS AF ON o.AFID = AF.AFID
LEFT JOIN Sticky_Data.Sticky_Dim_Campaign AS CAM ON o.Campaign_Id = CAM.Campaign_Id AND CAM.Entity = 'JF'
    WHERE DATETIME(time_stamp) BETWEEN DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), HOUR) AND DATETIME_TRUNC(datetime(current_timestamp, 'America/New_York'), HOUR) AND CAST(billing_cycle AS INTEGER) = 0 AND o.campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE Entity = 'JF')) AS data
    WHERE app = 'CL'
    QUALIFY ROW_NUMBER() OVER(PARTITION BY email_address, order_status ORDER BY TIMESTAMP(time_stamp) ASC) = 1) AS order_data ORDER BY time_stamp ASC) AS t1) AS t2
),
red_flags AS (
    SELECT consecutive FROM status_count WHERE consecutive >= 10
    QUALIFY ROW_NUMBER() OVER(ORDER BY consecutive DESC) = 1

)

SELECT 'CL' AS app, repeat_failures.*, coalesce(app_ranks.alert_level, 0) AS app_priority, coalesce(app_ranks.subs_count_t30d, 0) AS subs_count_t30d FROM (SELECT max(c) AS total, array_agg(DISTINCT decline_reason) AS decline_reasons FROM (
    SELECT (SELECT consecutive FROM start_spot) AS c, time_stamp, order_id, order_status, decline_reason, ROW_NUMBER() OVER(ORDER BY order_id DESC) AS rn FROM status_count WHERE order_id <= (SELECT order_id FROM start_spot) ORDER BY order_id DESC
) AS c_orders WHERE rn <= (SELECT consecutive FROM start_spot)) AS repeat_failures 
LEFT JOIN (SELECT app, rank() over(ORDER BY subs_count_t30d DESC) AS rank, alert_level, subs_count_t30d FROM (
SELECT app_short_name AS app, sum(subs_count_t30d) AS subs_count_t30d,
CASE WHEN sum(subs_count_t30d) > 25000 THEN 4 WHEN sum(subs_count_t30d) > 10000 THEN 3 WHEN sum(subs_count_t30d) > 5000 THEN 2 WHEN sum(subs_count_t30d) > 2000 THEN 1 ELSE 0 END AS alert_level
FROM (SELECT App_Name AS app_short_name, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
GROUP BY App_Name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC) AS app_ranks ON app_ranks.app = 'CL'
WHERE repeat_failures.total IS NOT NULL;

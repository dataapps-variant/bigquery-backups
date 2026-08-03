-- job_id: 6fecccd0-8ab9-4b50-9fe2-04de9e3e2ddb
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:16:18.192000+00:00
-- started: 2026-08-03T09:16:18.289000+00:00
-- ended: 2026-08-03T09:16:19.077000+00:00


    WITH status_count AS (
    SELECT gateway_id, time_stamp, order_id, customer_id, email_address, order_status, regexp_replace(decline_reason, r'(Unable to authorize payment for payment method ([0-9]*); Transaction Id: ([0-9]*)\.)|(Transaction ID = ([A-Z0-9]*))|(REFID:([0-9]*))', '') AS decline_reason, CASE WHEN order_status = 2 THEN 0 ELSE row_number() OVER (PARTITION BY gateway_id, grp ORDER BY time_stamp ASC, order_id ASC) END AS consecutive FROM (
    SELECT count(rst) OVER (PARTITION BY gateway_id ORDER BY time_stamp ASC, order_id ASC) AS grp, * FROM (
    SELECT CASE WHEN order_status <> lag(order_status) OVER (PARTITION BY gateway_id ORDER BY time_stamp ASC, order_id ASC) THEN 1 END AS rst, * FROM (
    SELECT CAST(time_stamp AS TIMESTAMP) AS time_stamp, CAST(customer_id AS INTEGER) AS customer_id, email_address, CAST(gateway_id AS INTEGER) AS gateway_id, CAST(order_id AS INTEGER) AS order_id, CAST(order_status AS INTEGER) AS order_status, decline_reason FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_Incremental` AS d
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON d.AFID = a.AFID
    WHERE DATETIME(time_stamp) BETWEEN DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), HOUR) AND DATETIME_TRUNC(datetime(current_timestamp, 'America/New_York'), HOUR) AND CAST(billing_cycle AS INTEGER) = 0 AND campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'CT') AND COALESCE(a.Country_Code, d.billing_country) = 'JP'
    QUALIFY ROW_NUMBER() OVER(PARTITION BY email_address, gateway_id, order_status ORDER BY TIMESTAMP(time_stamp) ASC) = 1) AS order_data ORDER BY time_stamp ASC) AS t1) AS t2
),
red_flags AS (
    SELECT gateway_id, consecutive FROM status_count WHERE consecutive >= 10
    QUALIFY ROW_NUMBER() OVER(PARTITION BY gateway_id ORDER BY consecutive DESC) = 1

)

SELECT 'CT - JP' AS app, rf.gateway_id, rf.consecutive, coalesce(app_ranks.alert_level, 0) AS app_priority, coalesce(app_ranks.subs_count_t30d, 0) AS subs_count_t30d FROM red_flags AS rf
LEFT JOIN (SELECT app, rank() over(ORDER BY subs_count_t30d DESC) AS rank, alert_level, subs_count_t30d FROM (
SELECT app_short_name AS app, sum(subs_count_t30d) AS subs_count_t30d,
CASE WHEN sum(subs_count_t30d) > 25000 THEN 4 WHEN sum(subs_count_t30d) > 10000 THEN 3 WHEN sum(subs_count_t30d) > 5000 THEN 2 WHEN sum(subs_count_t30d) > 2000 THEN 1 ELSE 0 END AS alert_level
FROM (SELECT app_short_name, sum(subs_count_t30d) AS subs_count_t30d FROM (
SELECT CASE WHEN App_Name = 'CT' THEN CASE WHEN Spend_Country_Code_AFID = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_short_name, Spend_Country_Code_AFID AS country_code, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
GROUP BY App_Name, Spend_Country_Code_AFID)
GROUP BY app_short_name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC) AS app_ranks ON app_ranks.app = 'CT - JP';

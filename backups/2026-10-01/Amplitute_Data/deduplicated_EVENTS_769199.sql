CREATE TABLE FUNCTION `variant-finance-data-project`.Amplitute_Data.deduplicated_EVENTS_769199(start_date DATE, end_date DATE)
AS
SELECT *
    FROM
        (SELECT *, ROW_NUMBER() OVER (
            PARTITION BY uuid
        ) rn
        FROM `Amplitute_Data`.`EVENTS_769199`
        WHERE DATE(event_time) >= start_date and DATE(event_time) <= end_date) t
    WHERE rn = 1;

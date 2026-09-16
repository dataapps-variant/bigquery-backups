CREATE TABLE FUNCTION `variant-finance-data-project`.Amplitude.deduplicated_EVENTS_625442(start_date DATE, end_date DATE)
AS
SELECT *
    FROM
        (SELECT *, ROW_NUMBER() OVER (
            PARTITION BY uuid
        ) rn
        FROM `Amplitude`.`EVENTS_625442`
        WHERE DATE(event_time) >= start_date and DATE(event_time) <= end_date) t
    WHERE rn = 1;

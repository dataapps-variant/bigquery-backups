-- job_id: script_job_71c9130713015cbc3cc5651330a817f8_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:05:24.308000+00:00
-- started: 2026-07-29T14:05:24.318000+00:00
-- ended: 2026-07-29T14:05:24.396000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_4ab1d494508953f783ceb2317a3566f5_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:30:05.545000+00:00
-- started: 2026-07-31T08:30:05.553000+00:00
-- ended: 2026-07-31T08:30:05.729000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

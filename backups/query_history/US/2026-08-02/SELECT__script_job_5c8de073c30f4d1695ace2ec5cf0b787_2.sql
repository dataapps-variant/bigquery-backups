-- job_id: script_job_5c8de073c30f4d1695ace2ec5cf0b787_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:04.061000+00:00
-- started: 2026-08-02T08:45:04.070000+00:00
-- ended: 2026-08-02T08:45:04.142000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

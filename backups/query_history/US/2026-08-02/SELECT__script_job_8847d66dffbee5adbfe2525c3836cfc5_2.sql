-- job_id: script_job_8847d66dffbee5adbfe2525c3836cfc5_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:04.323000+00:00
-- started: 2026-08-02T08:45:04.340000+00:00
-- ended: 2026-08-02T08:45:04.415000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

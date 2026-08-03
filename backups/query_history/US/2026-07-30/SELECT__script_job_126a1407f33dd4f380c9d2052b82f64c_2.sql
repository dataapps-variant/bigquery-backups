-- job_id: script_job_126a1407f33dd4f380c9d2052b82f64c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:41:33.322000+00:00
-- started: 2026-07-30T10:41:33.346000+00:00
-- ended: 2026-07-30T10:41:33.415000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

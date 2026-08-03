-- job_id: script_job_115def297ca6dee33d7284b038b1ee7c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:54:30.744000+00:00
-- started: 2026-07-30T10:54:30.754000+00:00
-- ended: 2026-07-30T10:54:30.814000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_62aa9156e56e62618d2dddf9ac53663f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:16:08.221000+00:00
-- started: 2026-07-30T10:16:08.234000+00:00
-- ended: 2026-07-30T10:16:08.317000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

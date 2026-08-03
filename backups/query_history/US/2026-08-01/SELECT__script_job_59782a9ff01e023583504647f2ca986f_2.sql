-- job_id: script_job_59782a9ff01e023583504647f2ca986f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:06.312000+00:00
-- started: 2026-08-01T08:45:06.335000+00:00
-- ended: 2026-08-01T08:45:06.406000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

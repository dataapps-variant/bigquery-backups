-- job_id: script_job_79f291c7bdf2ef144d682dcf742f651d_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:30:07.865000+00:00
-- started: 2026-08-01T09:30:07.873000+00:00
-- ended: 2026-08-01T09:30:07.940000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

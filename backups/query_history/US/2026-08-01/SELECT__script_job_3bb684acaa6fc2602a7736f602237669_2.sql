-- job_id: script_job_3bb684acaa6fc2602a7736f602237669_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:04.473000+00:00
-- started: 2026-08-01T08:45:04.493000+00:00
-- ended: 2026-08-01T08:45:04.554000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

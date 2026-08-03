-- job_id: script_job_af08569befac7eddad6ccd60b7d20fe0_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:10.324000+00:00
-- started: 2026-07-29T08:30:10.350000+00:00
-- ended: 2026-07-29T08:30:10.424000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

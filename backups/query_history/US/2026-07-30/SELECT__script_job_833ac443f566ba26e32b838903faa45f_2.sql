-- job_id: script_job_833ac443f566ba26e32b838903faa45f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:08.002000+00:00
-- started: 2026-07-30T08:45:08.019000+00:00
-- ended: 2026-07-30T08:45:08.170000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_61d9d9c68002e00e3b42dafe7decfdec_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:07.917000+00:00
-- started: 2026-07-30T08:30:07.934000+00:00
-- ended: 2026-07-30T08:30:07.992000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

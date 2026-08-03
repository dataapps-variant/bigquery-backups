-- job_id: script_job_ac8ff71e0802605d080bb91e665f9d0a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:08.530000+00:00
-- started: 2026-07-30T08:30:08.569000+00:00
-- ended: 2026-07-30T08:30:08.636000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_7fc637ae100551a7f4b4b2764d7166ce_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:30:05.470000+00:00
-- started: 2026-07-31T08:30:05.482000+00:00
-- ended: 2026-07-31T08:30:05.544000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

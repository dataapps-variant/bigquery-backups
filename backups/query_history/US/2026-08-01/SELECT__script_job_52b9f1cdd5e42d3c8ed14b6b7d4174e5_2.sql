-- job_id: script_job_52b9f1cdd5e42d3c8ed14b6b7d4174e5_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:09.014000+00:00
-- started: 2026-08-01T08:45:09.027000+00:00
-- ended: 2026-08-01T08:45:09.079000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

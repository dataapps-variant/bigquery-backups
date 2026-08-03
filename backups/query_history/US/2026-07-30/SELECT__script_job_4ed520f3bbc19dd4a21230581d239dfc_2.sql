-- job_id: script_job_4ed520f3bbc19dd4a21230581d239dfc_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:05.392000+00:00
-- started: 2026-07-30T08:45:05.406000+00:00
-- ended: 2026-07-30T08:45:05.481000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

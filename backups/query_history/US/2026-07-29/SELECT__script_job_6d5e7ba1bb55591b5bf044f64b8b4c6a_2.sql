-- job_id: script_job_6d5e7ba1bb55591b5bf044f64b8b4c6a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:07:35.871000+00:00
-- started: 2026-07-29T14:07:35.879000+00:00
-- ended: 2026-07-29T14:07:35.976000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

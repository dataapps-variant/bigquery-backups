-- job_id: script_job_72032d6df8cdf200f22b6c0ce9044b8d_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.907000+00:00
-- started: 2026-07-29T08:45:06.918000+00:00
-- ended: 2026-07-29T08:45:07.065000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

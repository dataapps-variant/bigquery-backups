-- job_id: script_job_3749e6d8bb8c0da7d40b02e5623344f1_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:04.093000+00:00
-- started: 2026-08-03T08:30:04.111000+00:00
-- ended: 2026-08-03T08:30:04.272000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

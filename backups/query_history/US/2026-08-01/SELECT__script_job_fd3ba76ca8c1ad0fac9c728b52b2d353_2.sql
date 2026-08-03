-- job_id: script_job_fd3ba76ca8c1ad0fac9c728b52b2d353_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:10.315000+00:00
-- started: 2026-08-01T08:30:10.327000+00:00
-- ended: 2026-08-01T08:30:10.405000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

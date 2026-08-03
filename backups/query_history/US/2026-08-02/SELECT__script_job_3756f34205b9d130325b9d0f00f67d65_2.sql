-- job_id: script_job_3756f34205b9d130325b9d0f00f67d65_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:04.966000+00:00
-- started: 2026-08-02T08:45:05.076000+00:00
-- ended: 2026-08-02T08:45:05.124000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

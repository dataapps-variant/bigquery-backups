-- job_id: script_job_ad6f397d0044bb1a93b55e3828440ed7_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:05.348000+00:00
-- started: 2026-08-02T08:45:05.463000+00:00
-- ended: 2026-08-02T08:45:05.527000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

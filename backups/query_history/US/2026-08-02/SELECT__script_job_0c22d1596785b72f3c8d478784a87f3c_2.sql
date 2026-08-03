-- job_id: script_job_0c22d1596785b72f3c8d478784a87f3c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:06.147000+00:00
-- started: 2026-08-02T08:45:06.157000+00:00
-- ended: 2026-08-02T08:45:06.207000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

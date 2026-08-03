-- job_id: script_job_314ff349d03e010d5b94c2224068df99_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:15:08.290000+00:00
-- started: 2026-08-02T09:15:08.304000+00:00
-- ended: 2026-08-02T09:15:08.363000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

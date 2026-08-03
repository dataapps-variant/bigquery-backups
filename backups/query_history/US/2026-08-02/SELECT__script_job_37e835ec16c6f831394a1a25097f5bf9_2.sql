-- job_id: script_job_37e835ec16c6f831394a1a25097f5bf9_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:45:05.648000+00:00
-- started: 2026-08-02T09:45:05.669000+00:00
-- ended: 2026-08-02T09:45:05.748000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

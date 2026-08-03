-- job_id: script_job_6a6a9efebfede7b5d99a19db3e4cdd74_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:04.266000+00:00
-- started: 2026-08-02T08:45:04.301000+00:00
-- ended: 2026-08-02T08:45:04.352000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_5e94ade27829b2e56c7c98365de96023_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:06.866000+00:00
-- started: 2026-08-02T08:45:06.874000+00:00
-- ended: 2026-08-02T08:45:06.920000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_988983035e5e145e465dab1f1923e147_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:00:06.492000+00:00
-- started: 2026-07-28T10:00:06.503000+00:00
-- ended: 2026-07-28T10:00:06.564000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

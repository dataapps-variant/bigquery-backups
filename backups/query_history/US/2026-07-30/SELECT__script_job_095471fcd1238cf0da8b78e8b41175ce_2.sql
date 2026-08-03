-- job_id: script_job_095471fcd1238cf0da8b78e8b41175ce_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:52:31.085000+00:00
-- started: 2026-07-30T10:52:31.096000+00:00
-- ended: 2026-07-30T10:52:31.149000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

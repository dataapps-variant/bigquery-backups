-- job_id: script_job_7efce3a546f0d0822ce88d6308ab5bcd_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T15:18:47.557000+00:00
-- started: 2026-07-28T15:18:47.569000+00:00
-- ended: 2026-07-28T15:18:47.711000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

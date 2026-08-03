-- job_id: script_job_aecaa239de040e8a2601f639dc95f3b9_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:08.056000+00:00
-- started: 2026-07-31T08:45:08.070000+00:00
-- ended: 2026-07-31T08:45:08.138000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

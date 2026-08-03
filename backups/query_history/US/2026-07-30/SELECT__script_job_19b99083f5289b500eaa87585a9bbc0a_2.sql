-- job_id: script_job_19b99083f5289b500eaa87585a9bbc0a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:45:08.630000+00:00
-- started: 2026-07-30T09:45:08.646000+00:00
-- ended: 2026-07-30T09:45:08.700000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_71b6eb845641e64563c5d66f6930258e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:45:11.082000+00:00
-- started: 2026-07-30T09:45:11.097000+00:00
-- ended: 2026-07-30T09:45:11.300000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

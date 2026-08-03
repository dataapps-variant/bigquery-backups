-- job_id: script_job_f5fa39c9ad02b4bba7f1a81239435763_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.462000+00:00
-- started: 2026-07-30T08:45:07.476000+00:00
-- ended: 2026-07-30T08:45:07.541000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

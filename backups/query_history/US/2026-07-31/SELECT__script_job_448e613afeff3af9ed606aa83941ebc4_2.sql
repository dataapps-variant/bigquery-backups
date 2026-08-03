-- job_id: script_job_448e613afeff3af9ed606aa83941ebc4_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.846000+00:00
-- started: 2026-07-31T08:45:05.877000+00:00
-- ended: 2026-07-31T08:45:05.961000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

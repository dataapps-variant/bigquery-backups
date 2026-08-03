-- job_id: script_job_b56c7807036d618264b2fe68bd395c94_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:14.354000+00:00
-- started: 2026-08-01T08:30:14.404000+00:00
-- ended: 2026-08-01T08:30:14.470000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

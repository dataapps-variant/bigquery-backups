-- job_id: script_job_e0bc7da1cfaea905dfc07d78f917ebe6_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:08.560000+00:00
-- started: 2026-08-01T08:45:08.573000+00:00
-- ended: 2026-08-01T08:45:08.625000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

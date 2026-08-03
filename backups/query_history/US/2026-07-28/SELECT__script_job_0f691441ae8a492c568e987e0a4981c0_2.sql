-- job_id: script_job_0f691441ae8a492c568e987e0a4981c0_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:03.771000+00:00
-- started: 2026-07-28T08:45:03.778000+00:00
-- ended: 2026-07-28T08:45:03.860000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

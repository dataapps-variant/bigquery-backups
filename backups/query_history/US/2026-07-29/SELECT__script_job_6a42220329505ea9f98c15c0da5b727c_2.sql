-- job_id: script_job_6a42220329505ea9f98c15c0da5b727c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.055000+00:00
-- started: 2026-07-29T08:45:06.067000+00:00
-- ended: 2026-07-29T08:45:06.140000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

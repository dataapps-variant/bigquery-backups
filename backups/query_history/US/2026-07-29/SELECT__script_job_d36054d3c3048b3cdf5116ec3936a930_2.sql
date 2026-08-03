-- job_id: script_job_d36054d3c3048b3cdf5116ec3936a930_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:09.796000+00:00
-- started: 2026-07-29T08:30:09.802000+00:00
-- ended: 2026-07-29T08:30:09.939000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_50c9544034028779c5fbdcedcb21c41c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:23:18.530000+00:00
-- started: 2026-07-29T10:23:18.537000+00:00
-- ended: 2026-07-29T10:23:18.610000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

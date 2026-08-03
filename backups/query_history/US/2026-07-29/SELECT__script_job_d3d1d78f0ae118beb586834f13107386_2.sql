-- job_id: script_job_d3d1d78f0ae118beb586834f13107386_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07+00:00
-- started: 2026-07-29T08:45:07.009000+00:00
-- ended: 2026-07-29T08:45:07.129000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

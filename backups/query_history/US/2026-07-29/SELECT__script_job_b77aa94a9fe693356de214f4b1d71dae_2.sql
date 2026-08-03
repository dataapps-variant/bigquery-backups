-- job_id: script_job_b77aa94a9fe693356de214f4b1d71dae_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:51:36.783000+00:00
-- started: 2026-07-29T09:51:36.792000+00:00
-- ended: 2026-07-29T09:51:36.864000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

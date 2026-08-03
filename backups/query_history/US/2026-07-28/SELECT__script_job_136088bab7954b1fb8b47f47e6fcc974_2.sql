-- job_id: script_job_136088bab7954b1fb8b47f47e6fcc974_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:36:23.716000+00:00
-- started: 2026-07-28T18:36:23.725000+00:00
-- ended: 2026-07-28T18:36:23.807000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

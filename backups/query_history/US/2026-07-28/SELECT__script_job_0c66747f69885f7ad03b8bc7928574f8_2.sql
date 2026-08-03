-- job_id: script_job_0c66747f69885f7ad03b8bc7928574f8_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:50:57.958000+00:00
-- started: 2026-07-28T17:50:57.969000+00:00
-- ended: 2026-07-28T17:50:58.051000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

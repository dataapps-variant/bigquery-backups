-- job_id: script_job_618b58c4792d0a642dd1eaec370bc35c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:10.140000+00:00
-- started: 2026-07-30T08:45:10.152000+00:00
-- ended: 2026-07-30T08:45:10.201000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

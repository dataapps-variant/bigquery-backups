-- job_id: script_job_208e2332fcefaeeda719df7e7456c5fb_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.103000+00:00
-- started: 2026-07-28T08:45:04.109000+00:00
-- ended: 2026-07-28T08:45:04.171000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_8f24401341e7f4dfab7d9d5a6e152dcf_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:29:36.446000+00:00
-- started: 2026-07-28T18:29:36.461000+00:00
-- ended: 2026-07-28T18:29:36.598000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

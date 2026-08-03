-- job_id: script_job_7c400c19cebc2e59641518733560bc7a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:03:16.290000+00:00
-- started: 2026-07-30T10:03:16.305000+00:00
-- ended: 2026-07-30T10:03:16.499000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

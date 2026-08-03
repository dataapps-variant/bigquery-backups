-- job_id: script_job_4bfd11c284020a0a940658ee1403056e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.910000+00:00
-- started: 2026-07-28T08:45:04.924000+00:00
-- ended: 2026-07-28T08:45:04.988000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

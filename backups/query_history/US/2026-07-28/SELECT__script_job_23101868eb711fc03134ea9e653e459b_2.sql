-- job_id: script_job_23101868eb711fc03134ea9e653e459b_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:28:18.445000+00:00
-- started: 2026-07-28T18:28:18.453000+00:00
-- ended: 2026-07-28T18:28:18.523000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

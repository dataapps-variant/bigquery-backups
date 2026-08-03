-- job_id: script_job_276571ceb0bc188c9ce10cce7590292e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:00:09.643000+00:00
-- started: 2026-07-30T10:00:09.675000+00:00
-- ended: 2026-07-30T10:00:09.757000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_cd17fc832623701393afe6c14dd796d1_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.266000+00:00
-- started: 2026-07-31T08:45:06.282000+00:00
-- ended: 2026-07-31T08:45:06.361000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

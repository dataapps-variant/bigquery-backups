-- job_id: script_job_d1c0b817fc4f4ea3abfac385b33953f3_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:05.675000+00:00
-- started: 2026-08-02T08:45:05.689000+00:00
-- ended: 2026-08-02T08:45:05.771000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

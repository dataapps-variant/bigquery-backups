-- job_id: script_job_0d95fbab8bb6f37f67a86b72cb5f07e7_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:10.190000+00:00
-- started: 2026-08-03T08:30:10.208000+00:00
-- ended: 2026-08-03T08:30:10.267000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

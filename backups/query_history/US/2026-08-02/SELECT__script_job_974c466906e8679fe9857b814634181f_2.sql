-- job_id: script_job_974c466906e8679fe9857b814634181f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:08.961000+00:00
-- started: 2026-08-02T08:30:08.973000+00:00
-- ended: 2026-08-02T08:30:09.034000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

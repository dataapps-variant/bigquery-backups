-- job_id: script_job_f2c9b43ac96b78eac62ebca454b75f11_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:08.927000+00:00
-- started: 2026-08-02T08:30:08.935000+00:00
-- ended: 2026-08-02T08:30:09.009000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

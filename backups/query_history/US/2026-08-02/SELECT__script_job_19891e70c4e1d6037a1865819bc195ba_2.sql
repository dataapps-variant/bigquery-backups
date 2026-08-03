-- job_id: script_job_19891e70c4e1d6037a1865819bc195ba_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:05.518000+00:00
-- started: 2026-08-02T08:45:05.528000+00:00
-- ended: 2026-08-02T08:45:05.599000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

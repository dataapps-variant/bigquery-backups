-- job_id: script_job_f7e20d697ac9b1291148aeb999e8e393_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.674000+00:00
-- started: 2026-08-02T08:45:03.687000+00:00
-- ended: 2026-08-02T08:45:03.750000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

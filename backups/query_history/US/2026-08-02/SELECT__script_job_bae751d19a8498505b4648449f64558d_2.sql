-- job_id: script_job_bae751d19a8498505b4648449f64558d_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:06.923000+00:00
-- started: 2026-08-02T08:45:06.940000+00:00
-- ended: 2026-08-02T08:45:07.007000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

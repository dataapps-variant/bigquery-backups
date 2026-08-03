-- job_id: script_job_b6c3956ecdaddf5986df6275acbaf8ee_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:30:10.760000+00:00
-- started: 2026-08-02T09:30:10.773000+00:00
-- ended: 2026-08-02T09:30:10.826000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

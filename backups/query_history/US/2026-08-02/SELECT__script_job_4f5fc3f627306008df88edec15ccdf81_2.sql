-- job_id: script_job_4f5fc3f627306008df88edec15ccdf81_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:04.125000+00:00
-- started: 2026-08-02T08:45:04.147000+00:00
-- ended: 2026-08-02T08:45:04.218000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

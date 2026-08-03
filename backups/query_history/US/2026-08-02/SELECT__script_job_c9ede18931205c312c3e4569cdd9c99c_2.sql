-- job_id: script_job_c9ede18931205c312c3e4569cdd9c99c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:06.687000+00:00
-- started: 2026-08-02T08:45:06.702000+00:00
-- ended: 2026-08-02T08:45:06.746000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

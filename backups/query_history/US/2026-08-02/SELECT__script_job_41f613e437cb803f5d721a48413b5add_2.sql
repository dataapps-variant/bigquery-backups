-- job_id: script_job_41f613e437cb803f5d721a48413b5add_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:30:06.282000+00:00
-- started: 2026-08-02T09:30:06.296000+00:00
-- ended: 2026-08-02T09:30:06.370000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

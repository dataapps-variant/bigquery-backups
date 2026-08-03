-- job_id: script_job_3d6bc7a6131f79baf336c617dc0cca0f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:05.889000+00:00
-- started: 2026-08-02T08:30:05.904000+00:00
-- ended: 2026-08-02T08:30:06.104000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_7a0bff7bda2347769cf087835cda9ee3_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:08.200000+00:00
-- started: 2026-08-02T08:45:08.212000+00:00
-- ended: 2026-08-02T08:45:08.276000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

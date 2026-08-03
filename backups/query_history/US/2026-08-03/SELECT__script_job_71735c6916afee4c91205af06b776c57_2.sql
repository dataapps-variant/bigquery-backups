-- job_id: script_job_71735c6916afee4c91205af06b776c57_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.787000+00:00
-- started: 2026-08-03T08:45:03.800000+00:00
-- ended: 2026-08-03T08:45:03.868000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_9639e79a7516cd41bf126a486c45e582_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:07.573000+00:00
-- started: 2026-08-01T08:45:07.585000+00:00
-- ended: 2026-08-01T08:45:07.639000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

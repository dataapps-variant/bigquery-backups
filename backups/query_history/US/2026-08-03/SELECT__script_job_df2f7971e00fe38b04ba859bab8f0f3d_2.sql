-- job_id: script_job_df2f7971e00fe38b04ba859bab8f0f3d_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.719000+00:00
-- started: 2026-08-03T08:45:04.727000+00:00
-- ended: 2026-08-03T08:45:04.778000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

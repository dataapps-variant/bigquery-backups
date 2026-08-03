-- job_id: script_job_886c4e3aa356887d1a3f131293a712e2_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:16:26.013000+00:00
-- started: 2026-07-28T18:16:26.035000+00:00
-- ended: 2026-07-28T18:16:26.113000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

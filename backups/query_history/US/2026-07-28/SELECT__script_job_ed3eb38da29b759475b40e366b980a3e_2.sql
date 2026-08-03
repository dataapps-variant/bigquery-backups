-- job_id: script_job_ed3eb38da29b759475b40e366b980a3e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:45:04.021000+00:00
-- started: 2026-07-28T09:45:04.042000+00:00
-- ended: 2026-07-28T09:45:04.123000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

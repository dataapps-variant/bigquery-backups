-- job_id: script_job_e376e0752ed3dbbbf1a250ab9c3b5db9_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.893000+00:00
-- started: 2026-08-03T08:45:04.903000+00:00
-- ended: 2026-08-03T08:45:04.948000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

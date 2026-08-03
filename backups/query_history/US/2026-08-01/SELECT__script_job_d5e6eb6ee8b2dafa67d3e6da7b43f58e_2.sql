-- job_id: script_job_d5e6eb6ee8b2dafa67d3e6da7b43f58e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:45:09.382000+00:00
-- started: 2026-08-01T09:45:09.407000+00:00
-- ended: 2026-08-01T09:45:09.489000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

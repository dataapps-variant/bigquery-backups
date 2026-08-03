-- job_id: script_job_edfe8e724f82d6fb16722d12f04ed89f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T16:31:48.450000+00:00
-- started: 2026-07-28T16:31:48.466000+00:00
-- ended: 2026-07-28T16:31:48.550000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

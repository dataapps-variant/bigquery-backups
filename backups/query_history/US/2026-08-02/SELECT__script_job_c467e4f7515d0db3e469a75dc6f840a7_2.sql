-- job_id: script_job_c467e4f7515d0db3e469a75dc6f840a7_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:15:06.029000+00:00
-- started: 2026-08-02T09:15:06.037000+00:00
-- ended: 2026-08-02T09:15:06.086000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_82467c12c15c1b748507c125e17694ef_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.875000+00:00
-- started: 2026-07-30T08:45:07.890000+00:00
-- ended: 2026-07-30T08:45:07.963000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

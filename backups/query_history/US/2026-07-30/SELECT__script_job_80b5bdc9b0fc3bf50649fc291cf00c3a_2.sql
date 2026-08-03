-- job_id: script_job_80b5bdc9b0fc3bf50649fc291cf00c3a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:53:45.214000+00:00
-- started: 2026-07-30T10:53:45.222000+00:00
-- ended: 2026-07-30T10:53:45.273000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

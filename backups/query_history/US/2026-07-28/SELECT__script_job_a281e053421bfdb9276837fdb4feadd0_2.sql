-- job_id: script_job_a281e053421bfdb9276837fdb4feadd0_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:45:05.161000+00:00
-- started: 2026-07-28T09:45:05.183000+00:00
-- ended: 2026-07-28T09:45:05.230000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

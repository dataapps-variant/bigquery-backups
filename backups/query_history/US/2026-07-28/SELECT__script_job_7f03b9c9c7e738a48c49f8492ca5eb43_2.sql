-- job_id: script_job_7f03b9c9c7e738a48c49f8492ca5eb43_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:30:06.919000+00:00
-- started: 2026-07-28T09:30:06.991000+00:00
-- ended: 2026-07-28T09:30:07.076000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_89765bcafa09ad6ce68c412e1f545715_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:55:13.405000+00:00
-- started: 2026-07-30T10:55:13.416000+00:00
-- ended: 2026-07-30T10:55:13.493000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

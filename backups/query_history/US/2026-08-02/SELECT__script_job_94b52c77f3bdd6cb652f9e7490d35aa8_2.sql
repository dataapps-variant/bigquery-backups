-- job_id: script_job_94b52c77f3bdd6cb652f9e7490d35aa8_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.977000+00:00
-- started: 2026-08-02T08:45:03.991000+00:00
-- ended: 2026-08-02T08:45:04.052000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

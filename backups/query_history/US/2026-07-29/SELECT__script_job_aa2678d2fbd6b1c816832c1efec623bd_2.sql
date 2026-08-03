-- job_id: script_job_aa2678d2fbd6b1c816832c1efec623bd_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:05.429000+00:00
-- started: 2026-07-29T08:45:05.454000+00:00
-- ended: 2026-07-29T08:45:05.523000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

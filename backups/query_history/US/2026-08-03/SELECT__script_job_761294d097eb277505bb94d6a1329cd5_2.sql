-- job_id: script_job_761294d097eb277505bb94d6a1329cd5_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.615000+00:00
-- started: 2026-08-03T08:45:03.626000+00:00
-- ended: 2026-08-03T08:45:03.679000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

-- job_id: script_job_cd701306243e1567e149ac81868b3a9c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.388000+00:00
-- started: 2026-07-29T08:45:07.400000+00:00
-- ended: 2026-07-29T08:45:07.450000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

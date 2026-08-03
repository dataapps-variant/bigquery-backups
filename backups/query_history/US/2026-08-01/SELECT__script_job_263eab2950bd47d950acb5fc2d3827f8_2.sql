-- job_id: script_job_263eab2950bd47d950acb5fc2d3827f8_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:07.341000+00:00
-- started: 2026-08-01T08:30:07.365000+00:00
-- ended: 2026-08-01T08:30:07.563000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

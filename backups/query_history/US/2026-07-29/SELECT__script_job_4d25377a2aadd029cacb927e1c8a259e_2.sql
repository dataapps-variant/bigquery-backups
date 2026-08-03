-- job_id: script_job_4d25377a2aadd029cacb927e1c8a259e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:10:06.696000+00:00
-- started: 2026-07-29T14:10:06.708000+00:00
-- ended: 2026-07-29T14:10:06.775000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

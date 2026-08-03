-- job_id: script_job_3acd81b9b128b8a2288ce17e3c7025e3_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:07.952000+00:00
-- started: 2026-08-02T08:30:07.973000+00:00
-- ended: 2026-08-02T08:30:08.202000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

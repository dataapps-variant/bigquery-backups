-- job_id: script_job_2128a14304292555b4812b297d1524a2_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:07.228000+00:00
-- started: 2026-08-02T08:30:07.248000+00:00
-- ended: 2026-08-02T08:30:07.316000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

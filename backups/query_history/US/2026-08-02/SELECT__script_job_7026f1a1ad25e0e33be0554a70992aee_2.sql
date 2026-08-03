-- job_id: script_job_7026f1a1ad25e0e33be0554a70992aee_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T10:00:23.845000+00:00
-- started: 2026-08-02T10:00:23.866000+00:00
-- ended: 2026-08-02T10:00:23.940000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status

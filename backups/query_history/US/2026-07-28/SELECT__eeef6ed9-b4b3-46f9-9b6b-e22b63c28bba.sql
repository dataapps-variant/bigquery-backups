-- job_id: eeef6ed9-b4b3-46f9-9b6b-e22b63c28bba
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:33.774000+00:00
-- started: 2026-07-28T10:01:33.834000+00:00
-- ended: 2026-07-28T10:01:35.483000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-18' AND activity_date <= DATE('2026-07-27')

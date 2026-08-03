-- job_id: 1236c41f-25bd-48a0-9c5e-d726ceab315c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:34.755000+00:00
-- started: 2026-07-28T09:59:34.839000+00:00
-- ended: 2026-07-28T09:59:36.648000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-1' AND activity_date <= DATE('2026-07-27')

-- job_id: 2df4a83c-d003-4280-a8f4-fa80eef85219
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:27.632000+00:00
-- started: 2026-07-28T10:02:27.719000+00:00
-- ended: 2026-07-28T10:02:29.418000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-2' AND activity_date <= DATE('2026-07-27')

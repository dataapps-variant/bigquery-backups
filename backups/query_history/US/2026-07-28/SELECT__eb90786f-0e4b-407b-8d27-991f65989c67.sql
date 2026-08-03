-- job_id: eb90786f-0e4b-407b-8d27-991f65989c67
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:29.446000+00:00
-- started: 2026-07-28T10:06:29.526000+00:00
-- ended: 2026-07-28T10:06:30.098000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-52' AND activity_date <= DATE('2026-07-27')

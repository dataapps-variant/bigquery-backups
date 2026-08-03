-- job_id: 5b8badfe-0086-4587-934e-703de2aa9374
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:53.960000+00:00
-- started: 2026-07-28T10:02:54.034000+00:00
-- ended: 2026-07-28T10:02:56.023000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-32' AND activity_date <= DATE('2026-07-27')
